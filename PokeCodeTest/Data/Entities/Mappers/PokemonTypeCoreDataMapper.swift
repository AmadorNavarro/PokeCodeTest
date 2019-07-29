//
//  PokemonTypeCoreDataMapper.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 28/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import CoreData

final class PokemonTypeCoreDataMapper: BaseCoreDataMapper<PokemonType, PokemonTypeData>, BaseDataMapper {
    
    func transform(entity: PokemonTypeData?) -> PokemonType {
        var domain = PokemonType()
        if let entity = entity {
            domain.name = entity.name ?? ""
        }
        return domain
    }
    
    func inverseTransform(domain: PokemonType?) -> PokemonTypeData {
        return PokemonTypeData()
    }
    
}
