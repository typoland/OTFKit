//
//  OTFFeatureProtocol.swift
//  OTF
//
//  Created by Łukasz Dziedzic on 10/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation

public protocol OTFBaseProtocol : Hashable {
    var name: String {get}
    var nameID: Int {get}
    var identifier: Int {get}
    
    //init (name: String, nameID: Int, identifier: Int)
}

extension OTFBaseProtocol {
    public static func == <F2:OTFBaseProtocol>(lhs: Self, rhs: F2) -> Bool {
        return lhs.name == rhs.name
    }
}

extension OTFBaseProtocol {
    public func hash(into hasher: inout Hasher) {
        return hasher.combine(name)
    }
}



