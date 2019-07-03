//
//  NSFont + OTFExtensions.swift
//  OTF
//
//  Created by Łukasz Dziedzic on 17/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation

extension NSFont {

    public func has<T:OTFTypeProtocol>(type:T, selector:T.Selector?) -> Bool {
        let types:[T] = featuresDescriptions()
        guard let typeInFont = types.filter({$0.name == type.name}).first
            else { return false }
        if let selector = selector {
            guard typeInFont.selectors.filter({$0.name == selector.name}).first != nil
                else {return false}
            return true
        }
        return true //If selector is nil, we're looking just for type
    }
	
	
    public func featuresDescriptions <T:OTFTypeProtocol> () -> [T] {
        typealias S = T.Selector
        var result: [T] = []
        for description in _featuresDescriptions {
            result.append(T.init(name: description.name,
								 nameID: description.nameID,
								 identifier: description.identifier,
								 exclusive: description.exclusive,
								 selectors: description.selectors))
        }
        return result
    }
    
    private var _featuresDescriptions : [(name:String,
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
    
    var allChars: String {
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
