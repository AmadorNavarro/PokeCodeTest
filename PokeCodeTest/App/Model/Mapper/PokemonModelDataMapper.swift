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
            domain.id = entity.id
            domain.name = entity.name
            domain.spritePath = entity.spritePath
            domain.weight = entity.weight
            domain.height = entity.height
            domain.baseExperience = String(entity.baseExperience)
            domain.types = PokemonTypeModelDataMapper().transform(entityList: entity.types)
            domain.catchDate = entity.catchDate.dateAndTimeToString()
            domain.order = entity.order
        }
        return domain
    }
    
    func inverseTransform(domain: PokemonModel?) -> Pokemon {
        var entity = Pokemon()
        if let domain = domain {
            entity.id = domain.id
            entity.name = domain.name
            entity.spritePath = domain.spritePath
            entity.weight = domain.weight
            entity.height = domain.height
            entity.baseExperience = Int(domain.baseExperience) ?? 0
            entity.types = PokemonTypeModelDataMapper().inverseTransform(domainList: domain.types)
            entity.catchDate = domain.catchDate.dateStringToTime()
            entity.order = domain.order
        }
        return entity
    }
    
}
