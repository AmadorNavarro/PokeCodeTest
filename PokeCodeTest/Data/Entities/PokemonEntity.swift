//
//  PokemonEntity.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 26/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation

struct PokemonEntity: Codable {
    
    var id: Int?
    var name: String?
    var spritePath: String?
    var weight: Int?
    var height: Int?
    var baseExperience: Int?
    var types: [PokemonTypeEntity]?
    
}
