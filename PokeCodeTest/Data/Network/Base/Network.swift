//
//  Network.swift
//  O-Results
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import RxAlamofire

final class Network {
    
    static let statusCodeMinError = 300
    let manager: SessionManager
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30 // Seconds
        manager = SessionManager(configuration: configuration)
    }
    
    func request<T: Codable>(type: T.Type, request: NetworkRequest) -> Observable<T> {
        
        manager.adapter = NetworkHeadersAdapter(request: request)
        
        return manager.rx.responseJSON(request.method, request.url, parameters: request.parameters, encoding: request.encoding())
            .map { response, data -> Any? in
                guard response.statusCode >= Network.statusCodeMinError else { return data }
                
                try self.showError(response: response, data: data)
                return nil
            }
            .mapObject(type: type, url: request.url)
    }
    
    func requestArray<T: Codable>(type: T.Type, request: NetworkRequest) -> Observable<[T]> {
        manager.adapter = NetworkHeadersAdapter(request: request)
        
        return manager.rx.responseJSON(request.method, request.url, parameters: request.parameters, encoding: request.encoding())
            .map { response, data -> Any? in
                guard response.statusCode >= Network.statusCodeMinError else { return data }
                
                try self.showError(response: response, data: data)
                return nil
            }
            .mapArray(type: type, url: request.url)
    }
    
    func requestString(request: NetworkRequest) -> Observable<String> {
        manager.adapter = NetworkHeadersAdapter(request: request)
        
        return manager.rx.responseData(request.method, request.url, parameters: request.parameters, encoding: request.encoding())
            .map { response, data -> Data? in
                guard response.statusCode >= Network.statusCodeMinError, let object = String(data: data, encoding: String.Encoding.utf8) else { return data }
                
                try self.showError(response: response, data: object)
                return nil
            }
            .mapString(url: request.url)
    }
    
    func requestServerData(request: NetworkRequest) -> Observable<Data> {
        manager.adapter = NetworkHeadersAdapter(request: request)
        
        return manager.rx.responseData(request.method, request.url, parameters: request.parameters, encoding: request.encoding())
            .map { response, data -> Data in
                guard response.statusCode >= Network.statusCodeMinError else { return data }
                
                try self.showError(response: response, data: data)
                return Data()
        }
    }
    
    func requestServerData<T: Codable>(type: T.Type, request: NetworkRequest, keyCodableStrategy: KeyCodableStrategy = .camelCase) -> Observable<T> {
        manager.adapter = NetworkHeadersAdapter(request: request)
        
        return manager.rx.responseData(request.method, request.url, parameters: request.parameters, encoding: request.encoding())
            .map { response, data -> Any? in
                guard response.statusCode >= Network.statusCodeMinError else { return data }
                
                try self.showError(response: response, data: data)
                return nil
            }
            .mapData(type: type, url: request.url, keyCodableStrategy: keyCodableStrategy)
    }
    
    private func showError(response: HTTPURLResponse, data: Any?) throws {
//        guard let data = data, let object: Codable = Mapper<APINetworkError>().map(JSONObject: data) ?? Mapper<Operation>().map(JSONString: String(describing: data)) else { return }
        
        print("\n**ERROR RESPONSE -> \n - URL: \(String(describing: response.url?.absoluteString))\n - StatusCode: \(response.statusCode)\n - TIME: \(Date().dateAndTimeToString())\n - Response: \(String(describing: data)) ")
//        throw object.error()
    }
    
}
