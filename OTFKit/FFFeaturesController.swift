//
//  OTFFeaturesController.swift
//  OTFKit
//
//  Created by Łukasz Dziedzic on 10/06/2019.
//  Copyright © 2019 Łukasz Dziedzic. All rights reserved.
//

import Foundation
import AppKit
import OTF

public class FFFeaturesController: NSObject {
    
    var types: OrderedSet<FFFType> = []
    var selectorInFonts: [FFFSelector : [ NSFont ]] = [:]
    var fonts: [NSFont] = []
    
    func add (fontNames: [String], size:CGFloat) {
        for fontName in fontNames {
            if let font = NSFont(name: fontName, size: size) {
                addTypeControllers(of: font)
            }
        }
    }
    
    func addTypeControllers (of font: NSFont) {
        
        fonts.append(font)
        
        for featureTypeDescription in font.featuresDescriptions {
            
            
            let (name, nameID, identifier, exclusive, selectors) = featureTypeDescription
            
            let featureType = FFFType(
                name: name,
                nameID: nameID,
                identifier: identifier,
                exclusive: exclusive)
            
            featureType.selectors = OrderedSet(selectors.map {
                FFFSelector (parent: featureType,
                             name: $0.name,
                             nameID: $0.nameID,
                             identifier: $0.identifier,
                             defaultSelector: $0.defaultSelector)
                
            })
            
            types.append(featureType)
            
            for selector in featureType.selectors {
                if selectorInFonts[selector] == nil {
                    selectorInFonts[selector] = [font]
                } else {
                    selectorInFonts[selector]?.append(font)
                }
            }
        }
    }
}
