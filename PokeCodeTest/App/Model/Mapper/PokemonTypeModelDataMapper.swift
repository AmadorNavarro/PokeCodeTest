//
//  PokemonTypeModelDataMapper.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 26/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation

final class PokemonTypeModelDataMapper: BaseModelDataMapper<PokemonTypeModel, PokemonType>, BaseDataMapper {

    func transform(entity: PokemonType?) -> PokemonTypeModel {
        var domain = PokemonTypeModel()
        if let entity = entity {
            domain.name = entity.name
        }
        return domain
    }
    
    func inverseTransform(domain: PokemonTypeModel?) -> PokemonType {
        return PokemonType()
    }
    
}
