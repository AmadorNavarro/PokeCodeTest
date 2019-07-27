//
//  SearchPokemonViewController.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 27/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import UIKit
import RxSwift

final class SearchPokemonViewController: BaseViewController<SearchPokemonViewModel> {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var catchButton: UIButton!
    
    override func createViewModel() -> SearchPokemonViewModel {
        return SearchPokemonViewModel()
    }
    
    override func setupLayout() {
        super.setupLayout()
        
    }
    
    override func setupRx() {
        super.setupRx()
        
        viewModel.name.bind(to: nameLabel.rx.text).disposed(by: disposeBag)
        viewModel.weight.bind(to: weightLabel.rx.text).disposed(by: disposeBag)
        viewModel.height.bind(to: heightLabel.rx.text).disposed(by: disposeBag)
        
        viewModel.existInBackpack.asObservable().bind { [weak self] catched in
            self?.catchButton.isHidden = !catched
            }.disposed(by: disposeBag)
        
        
    }

    @IBAction func userCatchThePokemon(_ sender: Any) {
    }
    
    @IBAction func userLeaveThePokemon(_ sender: Any) {
    }
    
}
