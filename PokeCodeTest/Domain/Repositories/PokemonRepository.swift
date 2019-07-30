//
//  PokemonRepository.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 26/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

protocol PokemonRepository {
    
    func searchPokemon() -> Single<Pokemon>
        
}
