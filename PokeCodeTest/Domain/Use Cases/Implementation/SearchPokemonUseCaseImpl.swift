//
//  SearchPokemonUseCaseImpl.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 26/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

final class SearchPokemonUseCaseImpl: BaseUseCaseImpl<PokemonRepository>, SearchPokemonUseCase {
    
    init() {
        super.init(repository: PokemonRepositoryImpl())
    }
    
    func execute() -> Single<Pokemon> {
        return repository.searchPokemon()
    }
    
}
