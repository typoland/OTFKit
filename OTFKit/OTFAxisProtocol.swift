//
//  OTFAxisProtocol.swift
//  OTFKit
//
//  Created by Łukasz Dziedzic on 03/07/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation

public protocol AxisProtocol {
	var name:String {get}
	var identifier:Int  {get}
	var minValue:Double {get}
	var maxValue:Double {get}
	var defaultValue:Double {get}
}

public enum OTFAxisProtocolKeys:String {
	case id = "NSCTVariationAxisIdentifier"
	case name = "NSCTVariationAxisName"
	case minValue = "NSCTVariationAxisMinimumValue"
	case defaultValue = "NSCTVariationAxisDefaultValue"
	case maxValue = "NSCTVariationAxisMaximumValue"
}

public protocol OTFAxisProtocol:AxisProtocol {
	init(identifier:Int, name: String, min:Double, default:Double, max:Double)
}
