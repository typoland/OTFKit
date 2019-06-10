//
//  OTFFeatureController.swift
//  OTFKit
//
//  Created by Łukasz Dziedzic on 10/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation
import OTF

public class OTFFeatureTypeController:OTFBaseFeatureController {
    
    var featureType: OTFFeatureType
    
    public init(_ featureType: OTFFeatureType) {
        self.featureType = featureType
    }
}
