//
//  OTFSelectorProtocol.swift
//  OTF
//
//  Created by Łukasz Dziedzic on 03/07/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation

public protocol OTFSelectorProtocol: OTFBaseProtocol {
	var defaultSelector: Int {get}
	init (name: String, nameID: Int, identifier: Int, defaultSelector: Int)
}

public extension OTFSelectorProtocol {
	func hash(into hasher: inout Hasher) {
		return hasher.combine(defaultSelector)
	}
}
