//
//  PokemonCoreDataMapper.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 28/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import CoreData

final class PokemonCoreDataMapper: BaseCoreDataMapper<PokemonEntity, PokemonData>, BaseDataMapper {
    
    func transform(entity: PokemonData?) -> PokemonEntity {
        var domain = PokemonEntity()
        if let entity = entity {
            domain.id = Int(entity.id)
            domain.name = entity.name
            domain.spritePath = entity.spritePath
            domain.weight = Int(entity.weight)
            domain.height = Int(entity.height)
            domain.baseExperience = Int(entity.baseExperience)
            domain.types = PokemonTypeCoreDataMapper().transform(entityList: entity.types())
        }
        return domain
    }
    
    func inverseTransform(domain: PokemonEntity?) -> PokemonData {
        return PokemonData()
    }
    
}
