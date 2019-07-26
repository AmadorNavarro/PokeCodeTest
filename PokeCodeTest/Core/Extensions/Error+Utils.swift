//
//  Error+Utils.swift
//  O-Results
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import Foundation

extension Error {
    
    func apiError() -> APINetworkError {
        switch self {
        case let error as APINetworkError:
            return error
        default:
            return APINetworkError(code: (self as NSError).code, message: (self as NSError).domain, raw: self.localizedDescription)
        }
    }
    
}
