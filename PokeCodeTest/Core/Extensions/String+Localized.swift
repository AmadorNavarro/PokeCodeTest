//
//  String+Localized.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import UIKit

extension String {
    
    var currentBundle: Bundle {
        return Translator.shared.currentBundle
    }
    
    var currentPluralBundle: Bundle {
        return Translator.shared.currentPluralBundle
    }
    
    public var localized: String {
        return NSLocalizedString(self, bundle: currentBundle, comment: "")
    }
    
    public func localizedString(replaceValues: Dictionary<String, String>) -> String {
        let originalString = NSMutableString(string: NSLocalizedString(self, bundle: currentBundle, comment: ""))

        for key in replaceValues.keys {
            let range = originalString.range(of: key)
            
            if range.location != NSNotFound {
                if let value = replaceValues[key] {
                    originalString.replaceCharacters(in: range, with: value)
                }
            }
        }
        
        return originalString as String
    }
    
    public func localizedPluralString(count: Int) -> String {
        return String.localizedStringWithFormat(NSLocalizedString(self, bundle: currentPluralBundle, comment: ""), count)
    }
    
}
