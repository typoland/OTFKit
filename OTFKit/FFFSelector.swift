//
//  OTFFeatureController.swift
//  OTFKit
//
//  Created by Łukasz Dziedzic on 10/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation
import OTF

public class FFFSelector:OTF.OTFSelector {
    
    public var parent: FFFType
    
    public init (parent:FFFType, name: String, nameID: Int?, identifier: Int, defaultSelector: Int?) {
        self.parent = parent
        super.init(name: name, nameID: nameID, identifier: identifier, defaultSelector: defaultSelector)
    }
    
}
