//
//  PokemonTypeCoreDataMapper.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 28/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import CoreData

final class PokemonTypeCoreDataMapper: BaseCoreDataMapper<PokemonTypeEntity, PokemonTypeData>, BaseDataMapper {
    
    func transform(entity: PokemonTypeData?) -> PokemonTypeEntity {
        var domain = PokemonTypeEntity()
        if let entity = entity {
            domain.name = entity.name
        }
        return domain
    }
    
    func inverseTransform(domain: PokemonTypeEntity?) -> PokemonTypeData {

        return PokemonTypeData()
    }
    
}
