//
//  JSONLogger.swift
//  O-Results
//
//  Created by Amador Navarro on 29/06/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation

final class JSONLogger {
    
    static let key = "jsonLoggerKey"
    
    static func setJSON(_ data: String) {
        #if DEBUG
        print(data)
        UserDefaults.standard.set(data, forKey: key)
        _ = UserDefaults.standard.synchronize()
        #endif
    }
    
    static func requestJSON() -> String? {
        #if DEBUG
        return UserDefaults.standard.string(forKey: key)
        #else
        return nil
        #endif
    }
    
    static func reset() {
        #if DEBUG
        print("Remove \(key) form UserDefault")
        UserDefaults.standard.set(nil, forKey: key)
        UserDefaults.standard.synchronize()
        #endif
    }
    
}
