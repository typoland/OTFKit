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
                result.append(axis)
            }
        }
        return result
    }
}

