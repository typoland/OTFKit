//
//  OTFAxis.swift
//  OTF
//
//  Created by Łukasz Dziedzic on 10/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation





public class OTFAxis: OTFAxisProtocol, CustomStringConvertible {
	
    
    public var name:String
    public var identifier:Int
    public var minValue:Double
    public var maxValue:Double
    public var defaultValue:Double
    //public var currentValue:Double
    
    required public init(identifier:Int, name: String, min:Double, default:Double, max:Double) {
        self.identifier = identifier
        self.name = name
        self.minValue = min
        self.defaultValue = `default`
        //MARK: Move to controller
        //self.currentValue = `default`
        self.maxValue = max
    }
}




