//
//  PokemonTypeEntity.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 26/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation

struct PokemonTypeEntity: Codable {
    
    enum CodingKeys: CodingKey {
        case type
    }
    
    enum TypeKeys: CodingKey {
        case name
    }
    
    var name: String?
    
    init() {}
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeContainer = try container.nestedContainer(keyedBy: TypeKeys.self, forKey: .type)
        name = try typeContainer.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var typeContainer = container.nestedContainer(keyedBy: TypeKeys.self, forKey: .type)
        try typeContainer.encode(name, forKey: .name)
    }
    
}
