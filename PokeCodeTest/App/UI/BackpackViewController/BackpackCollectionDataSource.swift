//
//  BackpackCollectionDataSource.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 29/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import UIKit
import RxSwift

final class BackpackCollectionDataSource: NSObject {
    
    var backpack: [PokemonModel] = []
    var disposeBag = DisposeBag()
    weak var viewModel: BackpackViewModel?
    
    init(viewModel: BackpackViewModel) {
        self.viewModel = viewModel
        super.init()
        
        setupRx()
    }
    
    private func setupRx() {
        disposeBag = DisposeBag()
        
        viewModel?.backpack.asObservable().bind { [weak self] backpack in
            guard let `self` = self else { return }
            self.backpack = backpack
            self.viewModel?.reloadAction.execute()
            }.disposed(by: disposeBag)
    }
    
}

extension BackpackCollectionDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return backpack.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BackpackPokemonCell.reuseIdentifier, for: indexPath) as? BackpackPokemonCell
        cell?.viewModel.setup(pokemon: backpack[indexPath.item])
        
        return cell ?? UICollectionViewCell()
    }
    
}
