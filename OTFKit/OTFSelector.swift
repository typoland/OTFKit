//
//  OTFFeatureController.swift
//  OTFKit
//
//  Created by Łukasz Dziedzic on 10/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation

public class OTFSelector: OTFBase, OTFSelectorProtocol {

    public var defaultSelector: Int
    
    required public init (
		name: String,
		nameID: Int,
		identifier: Int,
		defaultSelector: Int)
	{
        self.defaultSelector = defaultSelector
        super.init(name: name, nameID: nameID, identifier: identifier)
    }
}

extension OTFSelector: CustomStringConvertible {
    public var description: String {
		return "OTFSelector: \"\(name)\" nameID:\(nameID) identifier:\(identifier) defaultSelector:\(defaultSelector)"
    }
}
