//
//  PokemonTypeEntityDataMapper.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 26/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation

final class PokemonTypeEntityDataMapper: BaseEntityDataMapper<PokemonType, PokemonTypeEntity>, BaseDataMapper {
    
    func transform(entity: PokemonTypeEntity?) -> PokemonType {
        var domain = PokemonType()
        if let name = entity?.name {
            domain.name = name
        }
        return domain
    }
    
    func inverseTransform(domain: PokemonType?) -> PokemonTypeEntity {
        return PokemonTypeEntity()
    }
    
}
