//
//  RxSwift+Utils.swift
//  O-Results
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

extension PrimitiveSequence where Trait == SingleTrait {
    
    public func asMaybe() -> PrimitiveSequence<MaybeTrait, Element> {
        return self.asObservable().asMaybe()
    }
    
    public func asCompletable() -> PrimitiveSequence<CompletableTrait, Never> {
        return self.asObservable().flatMap { _ in Observable<Never>.empty() }.asCompletable()
    }
    
}

extension PrimitiveSequence where Trait == CompletableTrait, Element == Swift.Never {
    
    public func asMaybe() -> PrimitiveSequence<MaybeTrait, Element> {
        return self.asObservable().asMaybe()
    }
    
    func toSingleDefault<T>(with value: T) -> PrimitiveSequence<SingleTrait, T> {
        return Single<T>.create { observer in
            return self.subscribe(onCompleted: {
                observer(.success(value))
            }, onError: {
                observer(.error($0))
            })
        }
    }
    
}

extension ObservableType {
    
    public func mapObject<T: Codable>(type: T.Type, url: URLConvertible) -> Observable<T> {
        
        return flatMap { data -> Observable<T> in
            JSONLogger.setJSON("\nRESPONSE -> \n - URL: \(url) \n - TIME: \(Date().dayTimeToString()) \n - JSON: \(data)\n")
            let response = data as? (HTTPURLResponse, Data)
            guard let jsonData = response?.1 else {
                throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "ObjectMapper can't mapping"])
            }
            
            let object = try JSONDecoder().decode(T.self, from: jsonData)
            return Observable.just(object)
        }
    }
    
    public func mapArray<T: Codable>(type: T.Type, url: URLConvertible) -> Observable<[T]> {
        return flatMap { data -> Observable<[T]> in
            JSONLogger.setJSON("\nRESPONSE -> \n - URL: \(url) \n - TIME: \(Date().dayTimeToString()) \n - JSONArray: \(data)\n")
            let response = data as? (HTTPURLResponse, Data)
            guard let jsonData = response?.1 else {
                throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "ObjectMapper can't mapping"])
            }
            let object = try JSONDecoder().decode([T].self, from: jsonData)
            return Observable.just(object)
        }
    }
    
    public func mapString(url: URLConvertible) -> Observable<String> {
        return flatMap { plainData -> Observable<String> in
            guard let data = plainData as? Data, let object = String(data: data, encoding: .utf8) else {
                throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "ObjectMapper can't mapping"])
            }
            JSONLogger.setJSON("\nRESPONSE -> \n - URL: \(url) \n - TIME: \(Date().dayTimeToString()) \n - String: \(object)\n ")
            return Observable.just(object)
        }
    }
    
}
