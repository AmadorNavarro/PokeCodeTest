//
//  RequestPokemonUseCaseImpl.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 29/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

final class RequestPokemonUseCaseImpl: BaseUseCaseImpl<PokemonDataRepository>, RequestPokemonUseCase {
    
    init() {
        super.init(repository: PokemonDataRepositoryImpl())
    }
    
    func execute(pokemonID: Int) -> Single<Pokemon> {
        return repository.requestPokemon(pokemonID: pokemonID)
    }
    
}
