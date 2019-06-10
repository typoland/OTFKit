//
//  OTFFeaturesController.swift
//  OTFKit
//
//  Created by Łukasz Dziedzic on 10/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation
import AppKit

class OTFeaturesController {
    public var types: OTFFeatureTypeSet
    
    /*
     init (featuresController: OTFeaturesController) {
     types = []
     for type in featuresController.types {
     types.append(type)
     }
     }
     */
    init (from font:NSFont) {
        types = font.OTFFeaturesTypes
    }
    
    init (fontNames:[String], size:CGFloat) {
        types = []
        for fontName in fontNames {
            if let font = NSFont(name: fontName, size: size) {
                font.OTFFeaturesTypes.forEach({ type in
                    append(type)
                })
            }
        }
    }
    
    func append(_ type:OTFFeatureController) {
        types.append(type)
        for selector in type.selectors {
            append(selector)
        }
    }
    
    func append(_ selector:OTFFeature) {
        if types.contains(selector.parent) {
            selector.parent.selectors.append(selector)
            if let selectorIndex = selector.parent.selectors.firstIndex(of: selector) {
                
            }
            
            
        }
    }
    
    func addFontFeatureTypes(_ fontFeatureTypes:OTFFeatureTypeSet, fromFont font :NSFont ){
        for type in fontFeatures.types {
            self.addOTFType(type as! OTFType, fromFont: font)
            for selector in (type as! OTFType).typeSelectors {
                self.addFeature(selector as! OTFeature, fromFont: font)
            }
        }
    }
    
    func addFeature(_ feature:OTFFeature, fromFont: NSFont) {
        
        let index = Int(types.index(of: feature.parent))
        
        if index != NSNotFound {
            let type = types.object(at: index) as! OTFType
            feature.parent = type
            type.typeSelectors.add(feature)
            
            let featureIndex = type.typeSelectors.index(of: feature)
            if featureIndex != NSNotFound {
                let savedFeature = type.typeSelectors.object(at: featureIndex)
                (savedFeature as AnyObject).fonts.add(fromFont)
            }
        }
    }
    
    
}
