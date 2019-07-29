//
//  PokeCoreDataGateway.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 28/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

protocol PokeCoreDataGateway {
    
    func addPokemon(pokemon: Pokemon) -> Completable
    
    func recoveryBackpackPokemons() -> Single<[PokemonData]>
    
    func request(pokemonID: Int) -> Single<PokemonData>
    
}
