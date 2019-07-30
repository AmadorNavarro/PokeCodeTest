//
//  BackpackViewModel.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 29/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class BackpackViewModel: BaseViewModel {
    
    let recoveryBackpackUseCase = RecoveryBackpackPokemonsUseCaseImpl()
    var backpack = BehaviorRelay<[PokemonModel]>(value: [])
    
    func recoveryBackPack() {
        self.showLoadingAction.execute(.visible)
        _ = recoveryBackpackUseCase.execute()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] event in
                switch event {
                case .success(let response):
                    self?.backpack.accept(PokemonModelDataMapper().transform(entityList: response))
                case .error(let error):
                    self?.actionError.execute(error.apiError())
                }
                self?.showLoadingAction.execute(.gone)
            }.disposed(by: disposeBag)
    }
    
}
