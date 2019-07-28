//
//  SearchPokemonViewModel.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 27/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift

final class SearchPokemonViewModel: BaseViewModel {
    
    let searchPokemonUseCase = SearchPokemonUseCaseImpl()
    var imagePath = BehaviorSubject(value: "")
    var name = BehaviorSubject(value: "")
    var weight = BehaviorSubject(value: "")
    var height = BehaviorSubject(value: "")
    var existInBackpack = BehaviorSubject(value: false)
    var pokemon: PokemonModel? = nil
    
    func setup(pokemon: PokemonModel, existInBackpack: Bool = false) {
        self.pokemon = pokemon
        name.onNext(pokemon.name)
        imagePath.onNext(pokemon.spritePath)
        weight.onNext(pokemon.weight)
        height.onNext(pokemon.height)
        self.existInBackpack.onNext(existInBackpack)
    }
    
    func requestNewPokemon() {
        showLoadingAction.execute(.visible)
        _ = searchPokemonUseCase.execute()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] event in
                switch event {
                case .success(let response):
                    self?.setup(pokemon: PokemonModelDataMapper().transform(entity: response), existInBackpack: false)
                case .error(let error):
                    self?.actionError.execute(error.apiError())
                }
                self?.showLoadingAction.execute(.gone)
            }.disposed(by: disposeBag)
    }
    
}
