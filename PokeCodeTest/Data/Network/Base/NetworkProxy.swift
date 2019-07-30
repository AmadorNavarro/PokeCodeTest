//
//  NetworkProxy.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

class NetworkProxy {
    
    let network = Network()
    
    /// JSON
    
    /// Process a server call and parse the response as a JSON object
    ///    - Important:
    ///         - Use it if you want to get a single object response "only one"
    ///         - If you use a flatmap or map the autocomplete will return a PrimitiveSecuence<T> and you will get errors change it with Single<T> and that's all :D
    /// - parameters:
    ///     - type: use it to parse the object into the type of object that you want
    ///     - networkService: the configuration to call the API
    /// - returns: a Single<T> object with the response
    internal func process<T: Codable>(type: T.Type, networkService: NetworkRequest) -> Single<T> {
        return Network().request(type: type, request: networkService).asSingle()
    }
    
    /// Process a server call and parse the response as a JSON object
    ///    - Important:
    ///         Use it if you want to get a maybe object response "only one"
    /// - parameters:
    ///     - type: use it to parse the object into the type of object that you want
    ///     - networkService: the configuration to call the API
    /// - returns: a Maybe<T> object with the response
    internal func process<T: Codable>(type: T.Type, networkService: NetworkRequest) -> Maybe<T> {
        return Network().request(type: type, request: networkService).asMaybe()
    }
    
//    /// Process a server call and parse the response as a JSON object
//    ///    - Important:
//    ///         Use it if you want to get N objects response "multiples"
//    /// - parameters:
//    ///     - type: use it to parse the object into the type of object that you want
//    ///     - networkService: the configuration to call the API
//    /// - returns: a Observable<T> object with the response
//    internal func process<T: BaseEntity>(type: T.Type, networkService: NetworkRequest) -> Observable<T> {
//        return Network().request(type: type, request: networkService)
//    }
//
//    /// Process a server call and parse the response as a JSON object
//    ///    - Important:
//    ///         Use it if you want to get a success response without value only the success/error response
//    /// - parameters:
//    ///     - type: use it to parse the object into the type of object that you want
//    ///     - networkService: the configuration to call the API
//    /// - returns: a Completable object with the response
//    internal func process(networkService: NetworkRequest) -> Completable {
//        return Network().request(type: BaseEntity.self, request: networkService).asSingle().asCompletable()
//    }
    
    /// ARRAY
    
    /// Process a server call and parse the response as a Array object
    ///    - Important:
    ///         - Use it if you want to get a single object response "only one"
    ///         - If you use a flatmap or map the autocomplete will return a PrimitiveSecuence<T> and you will get errors change it with Single<T> and that's all :D
    /// - parameters:
    ///     - type: use it to parse the object into the type of object that you want
    ///     - networkService: the configuration to call the API
    /// - returns: a Single<T> object with the response
    internal func processArray<T: Codable>(type: T.Type, networkService: NetworkRequest) -> Single<[T]> {
        return Network().requestArray(type: type, request: networkService).asSingle()
    }
    
    /// Process a server call and parse the response as a Array object
    ///    - Important:
    ///         Use it if you want to get a single object response "only one"
    /// - parameters:
    ///     - type: use it to parse the object into the type of object that you want
    ///     - networkService: the configuration to call the API
    /// - returns: a Maybe<T> object with the response
    internal func processArray<T: Codable>(type: T.Type, networkService: NetworkRequest) -> Maybe<[T]> {
        return Network().requestArray(type: type, request: networkService).asMaybe()
    }
    
//    /// Process a server call and parse the response as a Array object
//    ///    - Important:
//    ///         Use it if you want to get N objects response "multiples"
//    /// - parameters:
//    ///     - type: use it to parse the object into the type of object that you want
//    ///     - networkService: the configuration to call the API
//    /// - returns: a Observable<T> object with the response
//    internal func processArray<T: BaseEntity>(type: T.Type, networkService: NetworkRequest) -> Observable<[T]> {
//        return Network().requestArray(type: type, request: networkService)
//    }
//    
//    /// Process a server call and parse the response as a Array object
//    ///    - Important:
//    ///         Use it if you want to get a success response without value only the success/error response
//    /// - parameters:
//    ///     - type: use it to parse the object into the type of object that you want
//    ///     - networkService: the configuration to call the API
//    /// - returns: a Completable object with the response
//    internal func processArray(networkService: NetworkRequest) -> Completable {
//        return Network().requestArray(type: BaseEntity.self, request: networkService).asSingle().asCompletable()
//    }
    
    /// String
    
    /// Process a server call and parse the response as a String object
    ///    - Important:
    ///         Use it if you want to get N objects response "multiples"
    /// - parameters:
    ///     - type: use it to parse the object into the type of object that you want
    ///     - networkService: the configuration to call the API
    /// - returns: a Observable<T> object with the response
    internal func processString(networkService: NetworkRequest) -> Observable<String> {
        return Network().requestString( request: networkService)
    }
    
    /// Process a server call and parse the response as a String object
    ///    - Important:
    ///         - Use it if you want to get a single object response "only one"
    ///         - If you use a flatmap or map the autocomplete will return a PrimitiveSecuence<T> and you will get errors change it with Single<T> and that's all :D
    /// - parameters:
    ///     - type: use it to parse the object into the type of object that you want
    ///     - networkService: the configuration to call the API
    /// - returns: a Single<T> object with the response
    internal func processString(networkService: NetworkRequest) -> Single<String> {
        return Network().requestString(request: networkService).asSingle()
    }
    
    /// Process a server call and parse the response as a String object
    ///    - Important:
    ///         Use it if you want to get a single object response "only one"
    /// - parameters:
    ///     - type: use it to parse the object into the type of object that you want
    ///     - networkService: the configuration to call the API
    /// - returns: a Maybe<T> object with the response
    internal func processString(networkService: NetworkRequest) -> Maybe<String> {
        return Network().requestString(request: networkService).asSingle().asMaybe()
    }
    
    /// Process a server call and parse the response as a String object
    ///    - Important:
    ///         Use it if you want to get a success response without value only the success/error response
    /// - parameters:
    ///     - type: use it to parse the object into the type of object that you want
    ///     - networkService: the configuration to call the API
    /// - returns: a Completable object with the response
    internal func processString(networkService: NetworkRequest) -> Completable {
        return Network().requestString(request: networkService).asSingle().asCompletable()
    }
    
    /// Process a server call and parse the response as a Data object
    ///    - Important:
    ///         Use it if you want to get a success response without value only the success/error response
    /// - parameters:
    ///     - networkService: the configuration to call the API
    /// - returns: a <T> object with the response
    internal func processData(networkService: NetworkRequest) -> Single<Data> {
        return Network().requestServerData(request: networkService).asSingle()
    }
    
    internal func processData<T: Codable>(type: T.Type, networkService: NetworkRequest, keyCodableStrategy: KeyCodableStrategy = .camelCase) -> Single<T> {
        return Network().requestServerData(type: type, request: networkService, keyCodableStrategy: keyCodableStrategy).asSingle()
    }

}
