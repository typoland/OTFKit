//
//  OTFTypeProtocol.swift
//  OTF
//
//  Created by Łukasz Dziedzic on 03/07/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation

public protocol OTFTypeProtocol: OTFBaseProtocol {
	
	associatedtype Selector: OTFSelectorProtocol
	associatedtype Selectors: Sequence where Selectors.Element == Selector
	var selectors: Selectors {get}
	var exclusive: Int {get}
	init (name: String, nameID: Int, identifier: Int, exclusive: Int, selectors: Selectors)
}

extension OTFTypeProtocol {
	init (name: String, nameID: Int, identifier: Int, exclusive: Int, selectors: [(name:String, nameID:Int, identifier:Int, defaultSelector:Int)]) {
		
		self.init (name: name,
				   nameID: nameID,
				   identifier: identifier,
				   exclusive: exclusive,
				   selectors: selectors.map {
					Selector.init(name: $0.name,
								  nameID: $0.nameID,
								  identifier: $0.identifier,
								  defaultSelector: $0.defaultSelector)} as! Self.Selectors)
	}
}

extension OTFTypeProtocol {
	public static func == <F2:OTFTypeProtocol>(lhs: Self, rhs: F2) -> Bool {
		return lhs.name == rhs.name
	}
}
