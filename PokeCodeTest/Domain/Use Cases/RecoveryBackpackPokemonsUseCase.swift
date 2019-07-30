//
//  RecoveryBackpackPokemonsUseCase.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 29/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

protocol RecoveryBackpackPokemonsUseCase {
    
    func execute() -> Single<[Pokemon]>
    
}
