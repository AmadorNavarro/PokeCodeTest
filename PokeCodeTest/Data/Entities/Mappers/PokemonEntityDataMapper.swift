//
//  PokemonEntityDataMapper.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 26/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation

final class PokemonEntityDataMapper: BaseEntityDataMapper<Pokemon, PokemonEntity>, BaseDataMapper {
    
    func transform(entity: PokemonEntity?) -> Pokemon {
        var domain = Pokemon()
        if let id = entity?.id {
            domain.id = id
        }
        if let name = entity?.name {
            domain.name = name
        }
        if let spritePath = entity?.spritePath {
            domain.spritePath = spritePath
        }
        if let weight = entity?.weight {
            domain.weight = weight
        }
        if let height = entity?.height {
            domain.height = height
        }
        if let baseExperience = entity?.baseExperience {
            domain.baseExperience = baseExperience
        }
        if let types = entity?.types {
            domain.types = PokemonTypeEntityDataMapper().transform(entityList: types)
        }
        if let order = entity?.order {
            domain.order = order
        }
        return domain
    }
    
    func inverseTransform(domain: Pokemon?) -> PokemonEntity {
        return PokemonEntity()
    }
    
}
