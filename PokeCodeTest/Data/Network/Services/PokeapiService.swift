//
//  PokeapiService.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 26/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

final class PokeapiService: NetworkProxy {

    func searchNewPokemon() -> Single<PokemonEntity> {
        let serviceRequest = NetworkRequest()
        serviceRequest.path = String(format: API.pathGetPokemon, arguments: [String(Int.pokemonID())])
        
        return processData(type: PokemonEntity.self, networkService: serviceRequest, keyCodableStrategy: .snake)
    }
 
}

