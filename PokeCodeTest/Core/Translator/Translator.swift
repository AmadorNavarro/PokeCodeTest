//
//  Translator.swift
//  O-Results
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import Foundation

open class Translator {
    
    enum AvailableLanguages: String { case spanish = "es-ES", english = "en-EN" }
    
    public static let settingsLanguageDidChangeNotifications = "SettingsLanguageDidChangeNotifications"
    static let shared = Translator()
    
    public let languages = Bundle.main.localizations.filter { language -> Bool in
        return language.count == 2
    }
    
    var currentLanguage = Translator.defaultLanguage()
    var currentBundle = Bundle.main
    var currentPluralBundle = Bundle.main
    var currentLocale = Locale.current
    
    // MARK: - Public Methods
    open class func localeForCurrentLanguage() -> Locale {
        return Locale(identifier: Translator.shared.currentLanguage)
    }
    
    open class func currentLanguageLocalizedString(language: String) -> String {
        return (localeForCurrentLanguage().localizedString(forIdentifier: language)?.capitalized)!
    }
    
    open func changeLanguage(_ language: String) {
        setCurrentLanguage(language)
        NotificationCenter.default.post(name: NSNotification.Name(Translator.settingsLanguageDidChangeNotifications), object: nil)
    }
    
    //  The app default language. If don't have one, return de device language
    open class func defaultLanguage() -> String {
        return Locale.current.languageCode!
    }
    
    // MARK: - Private Methods
    // This prevents others from using the default '()' initializer for this class.
    private init() {
        setCurrentLanguage(currentLanguage)
    }
    
    private func setCurrentLanguage(_ language: String) {
        if var currentBundlePath = Bundle.main.path(forResource: "Localizable", ofType: "strings", inDirectory: nil, forLocalization: language) {
            let bundlePath: NSString = currentBundlePath as NSString
            currentBundlePath = bundlePath.deletingLastPathComponent as String
            
            if let newBundle = Bundle(path: currentBundlePath) {
                currentBundle = newBundle
            }
        }
        
        if var currentPluralBundlePath = Bundle.main.path(forResource: "Localizable", ofType: "stringsdict", inDirectory: nil, forLocalization: language) {
            let bundlePath: NSString = currentPluralBundlePath as NSString
            currentPluralBundlePath = bundlePath.deletingLastPathComponent as String
            
            if let newBundle = Bundle(path: currentPluralBundlePath) {
                currentPluralBundle = newBundle
            }
        }
    }
    
}
