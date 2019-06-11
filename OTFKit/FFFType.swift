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
    
    public typealias Selector = FFFSelector
    
    public var selectors: OrderedSet<FFFSelector> {
        get {
            return _type.selectors
        } set {
            _type.selectors = newValue
        }
    }
    
    public var exclusive: Int? {
        return _type.exclusive
    }

    public var name: String {
        return _type.name
    }
    
    public var nameID: Int {
        return _type.nameID
    }

    public var identifier: Int {
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
