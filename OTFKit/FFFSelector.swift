//
//  OTFFeatureController.swift
//  OTFKit
//
//  Created by Łukasz Dziedzic on 10/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation
import OTF

public class FFFSelector: FFFBase, OTFSelectorProtocol {
    
    public var defaultSelector: Int?
    public var parent: FFFType
    
    public init (parent:FFFType, name: String, nameID: Int?, identifier: Int, defaultSelector: Int?) {
        self.parent = parent
        self.defaultSelector = defaultSelector
        super.init(name: name, nameID: nameID, identifier: identifier)
    }
}

extension FFFSelector {
    public override var description: String {
        return "OTFSelector \"\(name)\""
    }
}
