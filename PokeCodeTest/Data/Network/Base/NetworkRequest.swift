//
//  NetworkRequest.swift
//  O-Results
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkRequestConfiguration {
    
    var silent = false
    var discardErrors = false
    var allowsCacheResponse = false
    var needsOauth = false
    
}

class NetworkRequest {
    
    enum LogLevel { case parameters, headers, full, none }
    
    enum EncodeType { case json, array, form }
    
    var baseURL: String = API.baseURL
    var path = ""
    var method: HTTPMethod = .get
    var headers: [String : String]?
    var parameters: [String : Any]?
    var configuration = NetworkRequestConfiguration()
    var url: URLConvertible {
        return baseURL + path
    }
    var logLevel: LogLevel = .full
    var encodeType: EncodeType = .json
    
    func isOauth() -> Bool {
        return configuration.needsOauth
    }
    
    func encoding() -> ParameterEncoding {
        switch encodeType {
        case .json:
            return JSONEncoding.default
        case .array:
            return ArrayEncoding.default
        case .form:
            return URLEncoding.default
        }
    }
    
}
