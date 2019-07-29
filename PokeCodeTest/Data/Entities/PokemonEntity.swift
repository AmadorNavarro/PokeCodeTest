//
//  PokemonEntity.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 26/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation

struct PokemonEntity: Codable {
    
    enum CodingKeys: CodingKey {
        case id, name, sprites, weight, height, baseExperience, types, order
    }
    
    enum SpritesKeys: CodingKey {
        case frontDefault
    }
    
    var id: Int?
    var name: String?
    var spritePath: String?
    var weight: Int?
    var height: Int?
    var baseExperience: Int?
    var order: Int?
    var types: [PokemonTypeEntity]?
    
    init() {}
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        weight = try container.decode(Int.self, forKey: .weight)
        height = try container.decode(Int.self, forKey: .height)
        baseExperience = try container.decode(Int.self, forKey: .baseExperience)
        order = try container.decode(Int.self, forKey: .order)
        types = try container.decode([PokemonTypeEntity].self, forKey: .types)
        
        let spritesContainer = try container.nestedContainer(keyedBy: SpritesKeys.self, forKey: .sprites)
        spritePath = try spritesContainer.decode(String.self, forKey: .frontDefault)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(weight, forKey: .weight)
        try container.encode(height, forKey: .height)
        try container.encode(baseExperience, forKey: .baseExperience)
        try container.encode(types, forKey: .types)
        
        var spriteContainer = container.nestedContainer(keyedBy: SpritesKeys.self, forKey: .sprites)
        try spriteContainer.encode(spritePath, forKey: .frontDefault)
    }
    
}
