//
//  PokemonModelDataMapper.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 26/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation

final class PokemonModelDataMapper: BaseModelDataMapper<PokemonModel, Pokemon>, BaseDataMapper {

    func transform(entity: Pokemon?) -> PokemonModel {
        var domain = PokemonModel()
        if let entity = entity {
            domain.name = entity.name
            domain.spritePath = entity.spritePath
            domain.weight = String(entity.weight / 10) + "Kg."  // The pokemon weight is received in hectograms
            domain.height = String(entity.height / 10) + "m."   // The pokemon height is received in decimeters
            domain.baseExperience = String(entity.baseExperience)
            domain.types = PokemonTypeModelDataMapper().transform(entityList: entity.types)
            domain.catchDate = entity.catchDate.dateAndTimeToString()
        }
        return domain
    }
    
    func inverseTransform(domain: PokemonModel?) -> Pokemon {
        return Pokemon()
    }
    
}
