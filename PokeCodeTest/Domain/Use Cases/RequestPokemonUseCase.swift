//
//  RequestPokemonUseCase.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 29/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

protocol RequestPokemonUseCase {
    
    func execute(pokemonID: Int) -> Single<Pokemon>
    
}
