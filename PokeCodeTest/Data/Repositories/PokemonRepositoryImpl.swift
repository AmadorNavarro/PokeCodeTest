//
//  PokemonRepositoryImpl.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 26/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

final class PokemonRepositoryImpl: PokemonRepository {
    
    private var restAPI = PokeapiServiceGateway.shared
    
    func searchPokemon() -> Single<Pokemon> {
        return restAPI.searchNewPokemon().map { PokemonEntityDataMapper().transform(entity: $0) }
    }
    
}
