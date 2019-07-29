//
//  RecoveryBackpackPokemonsUseCaseImpl.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 29/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

final class RecoveryBackpackPokemonsUseCaseImpl: BaseUseCaseImpl<PokemonDataRepository>, RecoveryBackpackPokemonsUseCase {
    
    init() {
        super.init(repository: PokemonDataRepositoryImpl())
    }
    
    func execute() -> Single<[Pokemon]> {
        return repository.recoveryBackPackPokemons()
    }
    
}
