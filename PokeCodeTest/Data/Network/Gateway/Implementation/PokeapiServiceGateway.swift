//
//  PokeapiServiceGateway.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 26/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

final class PokeapiServiceGateway: PokeapiGateway {
    
    static let shared = PokeapiServiceGateway()
    private var service = PokeapiService()
    
    private init() {}
    
    func searchNewPokemon() -> Single<PokemonEntity> {
        return service.searchNewPokemon()
    }
    
}
