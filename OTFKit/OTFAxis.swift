//
//  OTFAxis.swift
//  OTF
//
//  Created by Łukasz Dziedzic on 10/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation


public class OTFAxis {
    public enum Keys:String {
        case id = "NSCTVariationAxisIdentifier"
        case name = "NSCTVariationAxisName"
        case minValue = "NSCTVariationAxisMinimumValue"
        case defaultValue = "NSCTVariationAxisDefaultValue"
        case maxValue = "NSCTVariationAxisMaximumValue"
        
    }
    public var name:String
    public var identifier:Int
    public var minValue:Double
    public var maxValue:Double
    public var defaultValue:Double
    //public var currentValue:Double
    
    public init(identifier:Int, name: String, min:Double, default:Double, max:Double) {
        self.identifier = identifier
        self.name = name
        self.minValue = min
        self.defaultValue = `default`
        //MARK: Move to controller
        //self.currentValue = `default`
        self.maxValue = max
    }
}

public extension OTFAxis {
    var dict:[String: Any] {
        return [Keys.id.rawValue:identifier as CFNumber as Any,
                Keys.name.rawValue: name as  Any,
                Keys.minValue.rawValue: minValue as CFNumber as Any,
                Keys.defaultValue.rawValue: defaultValue as CFNumber as Any,
                Keys.maxValue.rawValue: maxValue as CFNumber as Any
        ]
    }
}

extension OTFAxis:CustomStringConvertible {
    public var description: String {
        return "id: \(identifier), name: \(name) \(minValue)...\(defaultValue)...\(maxValue) "
    }
}

