//
//  Pokemon.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 26/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import UIKit

struct Pokemon {
    
    var id = 0
    var name = ""
    var spritePath = ""
    var weight = 0
    var height = 0
    var baseExperience = 0
    var types: [PokemonType] = []
    var catchDate = Date()
    var order = 0
    
}
