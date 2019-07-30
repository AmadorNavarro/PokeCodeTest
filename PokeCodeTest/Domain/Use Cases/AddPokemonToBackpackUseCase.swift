//
//  AddPokemonToBackpackUseCase.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 28/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

protocol AddPokemonToBackpackUseCase {
    
    func execute(pokemon: Pokemon) -> Completable
    
}
