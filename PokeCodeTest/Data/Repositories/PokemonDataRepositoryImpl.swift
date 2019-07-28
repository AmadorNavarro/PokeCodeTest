//
//  PokemonDataRepositoryImpl.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 28/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

final class PokemonDataRepositoryImpl: PokemonDataRepository {
    
    private var gateway = AppServiceGateway.shared
    
    func recovery() -> Completable {
        return restAPI.<#method#>
    }
    
}
