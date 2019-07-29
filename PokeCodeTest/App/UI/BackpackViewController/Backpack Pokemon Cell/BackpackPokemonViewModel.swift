//
//  BackpackPokemonViewModel.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 29/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import UIKit
import RxSwift

final class BackpackPokemonViewModel {
    
    var imagePath = BehaviorSubject(value: "")
    var name = BehaviorSubject(value: "")
    
    func setup(pokemon: PokemonModel) {
        imagePath.onNext(pokemon.spritePath)
        name.onNext(pokemon.name)
    }
    
}
