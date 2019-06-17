//
//  NSFont + extensionOTF.swift
//  FindFontFeatures
//
//  Created by Łukasz Dziedzic on 10/04/16.
//  Copyright © 2016 Łukasz Dziedzic. All rights reserved.
//

import Foundation


extension NSFont {

    var axesDict: [[OTFAxisProtocolKeys:Any]] {
        struct Axis:OTFAxisProtocol {
            init(identifier: Int, name: String, min: Double, default: Double, max: Double) {
                self.name = name
                self.identifier = identifier
                self.minValue = min
                self.defaultValue = `default`
                self.maxValue = max
            }
            
            var name: String
            var identifier: Int
            var minValue: Double
            var maxValue: Double
            var defaultValue: Double
        }
        let axes:[Axis] = getAxes()
        return axes.map { $0.dict }
    }
    
    func getAxes<Axis:OTFAxisProtocol>() -> [Axis] {
        
        var result :[Axis] = []
        
        let variation = CTFontCopyVariation(self as CTFont) as? [Int:Double] ?? [:]

        if let descriptor = CTFontCopyVariationAxes(self as CTFont) as? [[String:Any]] { //CTLine
            for axisDescription in descriptor {
                let identifier = axisDescription[OTFAxisProtocolKeys.id.rawValue] as? Int ?? 0
                let axis = Axis(identifier: identifier,
                                name: axisDescription[OTFAxisProtocolKeys.name.rawValue] as? String ?? "no name",
                                min: axisDescription[OTFAxisProtocolKeys.minValue.rawValue] as? Double ?? 0,
                                default: variation[identifier] ?? axisDescription[OTFAxisProtocolKeys.defaultValue.rawValue] as? Double ?? 0,
                                max: axisDescription[OTFAxisProtocolKeys.maxValue.rawValue] as? Double ?? 0)
                //print(axis)
                result.append(axis)
            }
        }
        return result
    }
    
    public func featuresDescriptions <T:OTFTypeProtocol> () -> [T] {
        typealias S = T.Selector
        var result: [T] = []
        for t in _featuresDescriptions {
            result.append(T.type(name: t.name, nameID: t.nameID, identifier: t.identifier, exclusive: t.exclusive, selectors: t.selectors))
        }
        return result
    }
    
    public var _featuresDescriptions : [(name:String,
        nameID:Int,
        identifier:Int,
        exclusive:Int,
        selectors: [(name:String, nameID:Int, identifier:Int, defaultSelector:Int)])] {
        
        let descriptor = self.fontDescriptor
        var result: [(name:String,
        nameID:Int,
        identifier:Int,
        exclusive:Int,
        selectors: [(name:String, nameID:Int, identifier:Int, defaultSelector:Int)])] = []
        
        if let featureDescriptions = CTFontDescriptorCopyAttribute(descriptor, kCTFontFeaturesAttribute) {
            
            for featureType in featureDescriptions  as! [[String:AnyObject]] {
                let name = featureType[kCTFontFeatureTypeNameKey as String]
                    as? String ?? "No Name Type"
                let nameID = featureType["CTFeatureTypeNameID"] as? Int ?? 0
                let identifier = featureType[kCTFontFeatureTypeIdentifierKey
                    as String]  as? Int ?? 0
                let exclusive = featureType[kCTFontFeatureTypeExclusiveKey as String  ]
                    as? Int ?? 0

                var selectors: [(name:String, nameID:Int, identifier:Int, defaultSelector:Int)] = []
                for feature in featureType[kCTFontFeatureTypeSelectorsKey as String ]
                    as! [[String:AnyObject]] {
                    let name = (feature[kCTFontFeatureSelectorNameKey as String ]
                        as? String ) ?? "No name Selector"
                    selectors.append((name:name,
                                         nameID: feature["CTFeatureSelectorNameID"]
                                            as? Int ?? 0,  //was Int?
                                         identifier: feature["CTFeatureSelectorIdentifier"]
                                            as? Int ?? 0,
                                         defaultSelector: feature[ kCTFontFeatureSelectorDefaultKey as String]
                                            as? Int ?? 0)) //was Int?
                    
                    
                }
                result.append((name: name, nameID: nameID, identifier: identifier, exclusive: exclusive, selectors: selectors))
                
            }
            
        }
        return result
    }
    
    var allChars:String {
        get {
            print("getting AllChars")
            let allFontChars = self.coveredCharacterSet.intersection(CharacterSet.controlCharacters.inverted)
            var result = ""
            for plane : UInt8 in 0...16 {
                if allFontChars.hasMember(inPlane: plane) {
                    
                    for c : UInt32 in UInt32( plane ) << 16 ..< (UInt32(plane)+1) << 16 {
                        if let scalar = UnicodeScalar(c)  {
                            if allFontChars.contains(scalar) {
                                var c1 = c.littleEndian // To make it byte-order safe
                                
                                let s = NSString(bytes: &c1, length: 4, encoding: String.Encoding.utf32LittleEndian.rawValue);
                                
                                result += (s != nil ? s! as String : "")
                            }
                        }
                    }
                }
            }
            return result
        }
        
    }
}

