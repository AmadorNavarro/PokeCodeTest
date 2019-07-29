//
//  BackpackViewController.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 29/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import UIKit
import RxSwift

final class BackpackViewController: BaseViewController<BackpackViewModel> {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataSource: BackpackCollectionDataSource? = nil
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if viewModel.backpack.value.isEmpty {
            viewModel.recoveryBackPack()
        }
    }
    
    override func createViewModel() -> BackpackViewModel {
        return BackpackViewModel()
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        collectionView.register(UINib(nibName: BackpackPokemonCell.preferredNibName(), bundle: nil), forCellWithReuseIdentifier: BackpackPokemonCell.reuseIdentifier)
        dataSource = BackpackCollectionDataSource(viewModel: viewModel)
        collectionView.dataSource = dataSource
        collectionView.delegate = self
    }
    
    override func setupRx() {
        super.setupRx()
        
        viewModel.reloadAction.onExecute { [weak self] in
            self?.collectionView.reloadData()
        }.disposed(by: disposeBag)
    }

    override func navBarTitle() -> String {
        return "PokeCodeTest_backpackController_title".localized
    }
}

extension BackpackViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let pokemon = viewModel.backpack.value[indexPath.item]
        let detailViewController = PokemonDetailViewController()
        detailViewController.viewModel.setup(pokemon: pokemon)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}

extension BackpackViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
    }
    
}
