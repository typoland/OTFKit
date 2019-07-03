//
//  FFFBase.swift
//  OTFKit
//
//  Created by Łukasz Dziedzic on 13/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation
import OTF

public class OTFBase: OTFBaseProtocol {
    
    public var name: String
    public var nameID: Int
    public var identifier: Int
    
    public init (name: String, nameID: Int, identifier: Int) {
        self.name = name
        self.nameID = nameID
        self.identifier = identifier
    }
    
}
