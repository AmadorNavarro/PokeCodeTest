//
//  PokemonModel.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 26/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import UIKit

struct PokemonModel {
    
    var id = 0
    var name = ""
    var spritePath = ""
    var weight = ""
    var height = ""
    var baseExperience = ""
    var types: [PokemonTypeModel] = []
    var catchDate = ""
    
}
