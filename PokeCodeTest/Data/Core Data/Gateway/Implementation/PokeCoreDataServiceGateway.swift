//
//  PokeCoreDataServiceGateway.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 28/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift
import CoreData

final class PokeCoreDataServiceGateway: PokeCoreDataGateway {
    
    static let shared = PokeCoreDataServiceGateway()
    private let model = DATAStack()
    
    private init() {}
    
    func addPokemon(pokemon: Pokemon) -> Completable {
        let context = model.newBackgroundContext()
        _ = PokemonData(entity: pokemon, context: context)
        var event = CompletableEvent.completed
        return Completable.create { completable in
            context.performAndWait {
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
                completable(event)
            }
            return Disposables.create()
        }
    }
    
    func recoveryBackpackPokemons() -> Single<[PokemonData]> {
        let context = model.mainContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PokemonData.entityName())
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: PokemonDataAttributes.order.rawValue, ascending: true)]
        let results = try? context.fetch(fetchRequest)
                
        return Observable<[PokemonData]>.create { observer in
            if let results = results as? [PokemonData] {
                observer.on(.next(results))
                observer.on(.completed)
            } else {
                observer.on(.error(NSError(domain: "PokeCodeTest", code: 406, userInfo: [NSLocalizedDescriptionKey : "Can't retrieve data"])))
            }
            return Disposables.create()
        }.asSingle()
    }
    
    func request(pokemonID: Int) -> Single<PokemonData> {
        let context = model.mainContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PokemonData.entityName())
        fetchRequest.predicate = NSPredicate(format: "id == %@", argumentArray: [String(pokemonID)])
        let result = try? context.fetch(fetchRequest) as? [PokemonData]
        
        return Observable<PokemonData>.create { observer in
            if let pokemon = result?.first {
                observer.on(.next(pokemon))
                observer.on(.completed)
            } else {
                observer.on(.error(NSError(domain: "PokeCodeTest", code: 407, userInfo: [NSLocalizedDescriptionKey : "Pokemon not found"])))
            }
            return Disposables.create()
        }.asSingle()
    }
    
}
