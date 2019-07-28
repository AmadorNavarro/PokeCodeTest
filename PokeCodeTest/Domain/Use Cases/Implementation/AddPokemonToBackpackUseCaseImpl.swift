//
//  AddPokemonToBackpackUseCaseImpl.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 28/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

final class AddPokemonToBackpackUseCaseImpl: BaseUseCaseImpl<<#repository#>>, AddPokemonToBackpackUseCase {
    
    init() {
        super.init(repository: <#repository#>Impl())
    }
    
    func execute() -> Completable {
        return repository.<#method#>
    }
    
}
