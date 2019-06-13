//
//  OTFFeatureController.swift
//  OTFKit
//
//  Created by Łukasz Dziedzic on 10/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation
import OTF

@objc public class FFFType: FFFBase, OTFTypeProtocol {
    
    public typealias Selector = FFFSelector

    public var exclusive: Int

    var _selectors: OrderedSet<FFFSelector>
    
    @objc public var selectors: Array<FFFSelector> {
        get { return Array(_selectors) }
        set { _selectors = OrderedSet( newValue ) }
    }
    
    public init(name: String,
                nameID: Int,
                identifier: Int,
                exclusive: Int,
                selectors: OrderedSet<Selector> = [])
    {
        self._selectors = selectors
        self.exclusive = exclusive
        super.init(name: name, nameID: nameID, identifier: identifier)
    }
}

extension FFFType {
    public override var description: String {
        return "OTFType \"\(name)\""
    }
}
