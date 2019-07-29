//
//  PokemonCoreDataMapper.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 28/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import CoreData

final class PokemonCoreDataMapper: BaseCoreDataMapper<Pokemon, PokemonData>, BaseDataMapper {
    
    func transform(entity: PokemonData?) -> Pokemon {
        var domain = Pokemon()
        if let entity = entity {
            domain.id = Int(entity.id)
            domain.name = entity.name ?? ""
            domain.spritePath = entity.spritePath ?? ""
            domain.weight = Int(entity.weight)
            domain.height = Int(entity.height)
            domain.baseExperience = Int(entity.baseExperience)
            domain.types = PokemonTypeCoreDataMapper().transform(entityList: entity.types())
            domain.catchDate = entity.catchDate ?? Date()
            domain.order = Int(entity.order)
        }
        return domain
    }
    
    func inverseTransform(domain: Pokemon?) -> PokemonData {
        return PokemonData()
    }
    
}
