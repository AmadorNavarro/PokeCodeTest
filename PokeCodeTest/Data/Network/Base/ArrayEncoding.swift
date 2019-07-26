//
//  ArrayEncoding.swift
//  O-Results
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import UIKit
import Alamofire

let arrayParametersKey = "arrayParametersKey"

/// Extenstion that allows an array be sent as a request parameters
extension Array {
    
    /// Convert the receiver array to a `Parameters` object.
    func asParameters(serviceRequest: NetworkRequest) -> Parameters {
        serviceRequest.encodeType = .array
        return [arrayParametersKey: self]
    }
    
}

/// Convert the parameters into a json array, and it is added as the request body.
/// The array must be sent as parameters using its `asParameters` method.
public struct ArrayEncoding: ParameterEncoding {
    
    // MARK: Properties
    
    /// Returns a `JSONEncoding` instance with default writing options.
    public static var `default`: ArrayEncoding { return ArrayEncoding() }
    
    /// The options for writing the parameters as JSON data.
    public let options: JSONSerialization.WritingOptions
    
    // MARK: Initialization
    
    /// Creates a new instance of the encoding using the given options
    ///
    /// - parameter options: The options used to encode the json. Default is `[]`
    ///
    /// - returns: The new instance
    public init(options: JSONSerialization.WritingOptions = []) {
        self.options = options
    }
    
    // MARK: Encoding
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = try urlRequest.asURLRequest()
        
        guard let parameters = parameters, let array = parameters[arrayParametersKey] else {
                return urlRequest
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: array, options: options)
            
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
            urlRequest.httpBody = data
        } catch {
            throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
        }
        
        return urlRequest
    }
    
}
