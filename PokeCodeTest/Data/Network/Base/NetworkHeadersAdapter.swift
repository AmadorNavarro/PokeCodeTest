//
//  NetworkHeadersAdapter.swift
//  O-Results
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import RxAlamofire
import Alamofire

final class NetworkHeadersAdapter: RequestAdapter {
    
    private var request = NetworkRequest()

    init(request: NetworkRequest) {
        self.request = request
    }
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        
        var log = "\nREQUEST -> \n - URL: \(request.url) \n - METHOD: \(request.method) \n - TIME: \(Date().dateAndTimeToString())"
        
        switch request.logLevel {
        case .parameters:
            log = "\(log) \n - PARAMETERS: \(String(describing: request.parameters))"
        case . headers:
            log = "\(log) \n - HEADERS: \(String(describing:urlRequest.allHTTPHeaderFields))"
        case .full:
            log = "\(log) \n - PARAMETERS: \(String(describing: request.parameters)) \n - HEADERS: \(String(describing:urlRequest.allHTTPHeaderFields))"
        case .none:
            log = ""
        }

        print(log + "\n")
        
        return urlRequest
    }
   
}
