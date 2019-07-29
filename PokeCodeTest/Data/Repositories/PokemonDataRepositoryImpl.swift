//
//  PokemonDataRepositoryImpl.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 28/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

final class PokemonDataRepositoryImpl: PokemonDataRepository {
    
    private var gateway = PokeCoreDataServiceGateway.shared
    
    func addPokemonToBackpack(pokemon: Pokemon) -> Completable {
        return gateway.addPokemon(pokemon: pokemon)
    }
    
    func recoveryBackPackPokemons() -> Single<[Pokemon]> {
        return gateway.recoveryBackpackPokemons().map { PokemonCoreDataMapper().transform(entityList: $0) }
    }
    
    func requestPokemon(pokemonID: Int) -> Single<Pokemon> {
        return gateway.request(pokemonID: pokemonID).map { PokemonCoreDataMapper().transform(entity: $0) }
    }
    
}
