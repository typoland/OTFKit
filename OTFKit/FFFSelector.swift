//
//  OTFFeatureController.swift
//  OTFKit
//
//  Created by Łukasz Dziedzic on 10/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation
import OTF

public class FFFSelector:NSObject, OTFSelectorProtocol {
    public var defaultSelector: Int?
    
    @objc public var name: String {
        return _selector.name
    }
    
    @objc public var nameID: Int {
        return _selector.nameID
    }
    
    @objc public var identifier: Int {
        return _selector.identifier
    }
    
    private var _selector: OTFSelector
    
    @objc public var parent: FFFType
    
    public init (parent:FFFType, name: String, nameID: Int?, identifier: Int, defaultSelector: Int?) {
        self.parent = parent
        self._selector = OTFSelector.init(name: name, nameID: nameID, identifier: identifier, defaultSelector: defaultSelector)
        super.init()
    }
}

extension FFFSelector {
    public override var description: String {
        return "OTFSelector \"\(name)\""
    }
}
