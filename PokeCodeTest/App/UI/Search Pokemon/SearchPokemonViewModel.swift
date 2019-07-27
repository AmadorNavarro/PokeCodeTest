//
//  SearchPokemonViewModel.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 27/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

final class SearchPokemonViewModel: BaseViewModel {
    
    var imagePath = BehaviorSubject(value: "")
    var name = BehaviorSubject(value: "")
    var weight = BehaviorSubject(value: "")
    var height = BehaviorSubject(value: "")
    var existInBackpack = BehaviorSubject(value: false)
    
    func setup(pokemon: PokemonModel, existInBackpack: Bool = false) {
        name.onNext(pokemon.name)
        imagePath.onNext(pokemon.spritePath)
        weight.onNext(pokemon.weight)
        height.onNext(pokemon.height)
        self.existInBackpack.onNext(existInBackpack)
    }
    
}
