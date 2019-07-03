//
//  OTFFeatureController.swift
//  OTFKit
//
//  Created by Łukasz Dziedzic on 10/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation
import OTF

public class OTFType<S: OTFSelectorProtocol>: OTFBase, OTFTypeProtocol {
    
    public typealias Selector = S
    public var exclusive: Int

    var _selectors: OrderedSet<Selector>
    public var selectors: Array<Selector> {
        get { return Array(_selectors) }
        set { _selectors = OrderedSet( newValue ) }
    }
    
    required public init(name: String,
                nameID: Int,
                identifier: Int,
                exclusive: Int,
                selectors: [Selector] = [])
    {
        self._selectors = OrderedSet(selectors)
        self.exclusive = exclusive
        super.init(name: name, nameID: nameID, identifier: identifier)
    }
}

extension OTFType {
    public var description: String {
        return "OldOTFType \"\(name)\""
    }
}
