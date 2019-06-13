//
//  OTFFeatureController.swift
//  OTFKit
//
//  Created by Łukasz Dziedzic on 10/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation
import OTF

@objc public class FFFType: NSObject, OTFTypeProtocol {
    
    public var exclusive: Int? {
        return _type.exclusive
    }
    
    
    public typealias Selector = FFFSelector
    
    @objc public var selectors: Array<FFFSelector> {
        get {
            return Array(_type.selectors)
        } set {
            _type.selectors = OrderedSet( newValue )
        }
    }
    
    @objc public var exclusive_: Int {
        return exclusive ?? -1
    }

    @objc public var name: String {
        return _type.name
    }
    
    @objc public var nameID: Int {
        return _type.nameID
    }

    @objc public var identifier: Int {
        return _type.identifier
    }

    private var _type:OTFType<FFFSelector>
    
    public init(name: String,
                nameID: Int?,
                identifier: Int,
                exclusive: Int?,
                selectors: OrderedSet<Selector> = [])
    {
        _type = OTFType(name: name, nameID: nameID, identifier: identifier, exclusive: exclusive, selectors: selectors)
        super.init()
    }
}

extension FFFType {
    public override var description: String {
        return "OTFType \"\(name)\""
    }
}
