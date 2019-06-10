//
//  OTFFBaseObjectController.swift
//  OTFKit
//
//  Created by Łukasz Dziedzic on 10/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation
import AppKit
import OTF

open class OTFBaseFeatureController: NSObject {
    @objc var selected: Int = 0
    @objc var search: Int = 0
    @objc var enabled: Bool { get { return false }}
}

extension OTFBaseFeatureController {
    @objc var toolTip:String {
        get {
            return "\(name) \(self is OTFeature ?  " from \((self as! OTFeature).parent.name)" : "")\n\tindentifier: \(identifier)\n\tname ID: \(nameID == nil ? String(describing: nameID) : "no" )" + "\n\n\tseleced: \(selected == 1 ? "Yes":"No")\n\tsearch: \(search)" //+ ("\n\tHash:\n\(name.hashValue) \n\(identifier.hashValue)")
        }
    }
}


