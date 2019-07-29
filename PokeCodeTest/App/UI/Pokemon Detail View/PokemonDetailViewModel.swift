//
//  PokemonDetailViewModel.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 30/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

final class PokemonDetailViewModel: BaseViewModel {
    
    var imagePath = BehaviorSubject(value: "")
    var name = BehaviorSubject(value: "")
    var types = BehaviorSubject(value: "")
    var weightTitle = BehaviorSubject(value: "PokeCodeTest_pokemon_detail_view_weight_title".localized)
    var weightValue = BehaviorSubject(value: "")
    var heightTitle = BehaviorSubject(value: "PokeCodeTest_pokemon_detail_view_height_title".localized)
    var heightValue = BehaviorSubject(value: "")
    var baseExperienceTitle = BehaviorSubject(value: "PokeCodeTest_pokemon_detail_view_base_experience_title".localized)
    var baseExperienceValue = BehaviorSubject(value: "")
    var catchedDate = BehaviorSubject(value: "")
    
    func setup(pokemon: PokemonModel) {
        imagePath.onNext(pokemon.spritePath)
        name.onNext(pokemon.name)
        types.onNext(typesString(types: pokemon.types))
        weightValue.onNext(String(Double(pokemon.weight / 10)) + "Kg.")
        heightValue.onNext(String(Double(pokemon.height / 10)) + "m.")
        baseExperienceValue.onNext(pokemon.baseExperience)
        catchedDate.onNext(pokemon.catchDate)
    }
    
    func typesString(types: [PokemonTypeModel]) -> String {
        var typesString = ""
        for (index, type) in types.enumerated() {
            typesString.append(type.name)
            if index < types.count - 1 {
                typesString.append(", ")
            }
        }
        return typesString
    }
    
}
