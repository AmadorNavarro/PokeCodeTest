//
//  AddPokemonToBackpackUseCaseImpl.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 28/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

final class AddPokemonToBackpackUseCaseImpl: BaseUseCaseImpl<PokemonDataRepository>, AddPokemonToBackpackUseCase {
    
    init() {
        super.init(repository: PokemonDataRepositoryImpl())
    }
    
    func execute(pokemon: Pokemon) -> Completable {
        return repository.addPokemonToBackpack(pokemon: pokemon)
    }
    
}
