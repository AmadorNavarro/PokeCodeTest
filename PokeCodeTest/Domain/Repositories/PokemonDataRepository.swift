//
//  PokemonDataRepository.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 28/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

protocol PokemonDataRepository {
    
    func addPokemonToBackpack(pokemon: Pokemon) -> Completable
    
    func recoveryBackPackPokemons() -> Single<[Pokemon]>
        
}
