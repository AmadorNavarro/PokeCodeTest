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
        var model = PokemonTypeModel()
        if let domain = entity {
            model.name = domain.name
        }
        return model
    }
    
    func inverseTransform(domain: PokemonTypeModel?) -> PokemonType {
        var entity = PokemonType()
        if let model = domain {
            entity.name = model.name
        }
        return entity
    }
    
}
