//
//  PokeCoreDataServiceGateway.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 28/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

final class PokeCoreDataServiceGateway: PokeCoreDataGateway {
    
    static let shared = PokeCoreDataServiceGateway()
    private let model = DATAStack()
    
    private init() {}
    
    func addPokemon(pokemon: PokemonEntity) -> Completable {
        let context = model.newBackgroundContext()
        _ = PokemonData(entity: pokemon, context: context)
        var event = CompletableEvent.completed
        if context.hasChanges {
            do {
                try context.save()
            } catch let error as NSError {
                event = .error(error)
                print("Cannot save Core Dara Context. Error \(error.localizedDescription)")
            }
        } else {
            event = .error(NSError(domain: "PokeCodeTest", code: 405, userInfo: [NSLocalizedDescriptionKey : "No core data changes found"]))
        }
        return Completable.create { completable in
            completable(event)
            return Disposables.create()
        }
    }
    
    func recoveryBackpackPokemons() -> Single<[PokemonData]> {
        
    }
    
}
