//
//  SearchPokemonViewModel.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 27/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action

final class SearchPokemonViewModel: BaseViewModel {
    
    let searchPokemonUseCase = SearchPokemonUseCaseImpl()
    let addPokemonUseCase = AddPokemonToBackpackUseCaseImpl()
    let requestPokemonUseCase = RequestPokemonUseCaseImpl()
    var leaveButtonTitle = BehaviorSubject(value: "PokeCodeTest_search_view_leavebutton_title".localized)
    var imagePath = BehaviorSubject(value: "")
    var name = BehaviorSubject(value: "")
    var weight = BehaviorSubject(value: "")
    var height = BehaviorSubject(value: "")
    var existInBackpack = BehaviorSubject(value: false)
    var pokemon = BehaviorRelay<PokemonModel?>(value: nil)
    let addBackpack = CocoaAction { return .empty() }
    
    func setup(pokemon: PokemonModel, existInBackpack: Bool = false) {
        self.pokemon.accept(pokemon)
        name.onNext(pokemon.name)
        imagePath.onNext(pokemon.spritePath)
        let weight = String(Double(pokemon.weight) / 10) + "Kg."    // The pokemon weight are in hectograms.
        self.weight.onNext(weight)
        let height = String(Double(pokemon.height) / 10) + "m."     // The pokemon height are in decimeters.
        self.height.onNext(height)
        self.existInBackpack.onNext(existInBackpack)
    }
    
    func requestNewPokemon() {
        guard state != .loading else { return }
        guard reachability != .notReachable else {
            notInternetConnection.execute()
            return
        }
        state = .loading
        showLoadingAction.execute(.visible)
        _ = searchPokemonUseCase.execute()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] event in
                self?.state = .loaded
                switch event {
                case .success(let response):
                    self?.requestPokemon(PokemonModelDataMapper().transform(entity: response))
                case .error(let error):
                    self?.actionError.execute(error.apiError())
                }
                self?.showLoadingAction.execute(.gone)
            }.disposed(by: disposeBag)
    }
    
    func catchCurrentPokemon() {
        guard let pokemon = pokemon.value else { return }
        _ = addPokemonUseCase.execute(pokemon: PokemonModelDataMapper().inverseTransform(domain: pokemon))
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] event in
                switch event {
                case .completed:
                    self?.clearPokemon()
                    self?.addBackpack.execute()
                case .error(let error):
                    self?.actionError.execute(error.apiError())
                }
            }.disposed(by: disposeBag)
    }
    
    func requestPokemon(_ pokemon: PokemonModel) {
        _ = requestPokemonUseCase.execute(pokemonID: pokemon.id)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] event in
                var isInBackpack = false
                switch event {
                case .success(_):
                    isInBackpack = true
                    self?.actionError.execute(APINetworkError(code: 408, message: "PokeCodeTest_pokemon_exist_in_backpack".localized, raw: ""))
                case .error(_):
                    isInBackpack = false
                }
                self?.setup(pokemon: pokemon, existInBackpack: isInBackpack)
            }.disposed(by: disposeBag)
    }
    
    func clearPokemon() {
        pokemon.accept(nil)
        name.onNext("")
        imagePath.onNext("")
        weight.onNext("")
        height.onNext("")
        self.existInBackpack.onNext(false)
    }
    
}
