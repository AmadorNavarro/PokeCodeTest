//
//  SearchPokemonViewController.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 27/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

final class SearchPokemonViewController: BaseViewController<SearchPokemonViewModel> {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var catchButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if viewModel.pokemon == nil {
            viewModel.requestNewPokemon()
        }
    }
    
    override func createViewModel() -> SearchPokemonViewModel {
        return SearchPokemonViewModel()
    }
    
    override func setupLayout() {
        super.setupLayout()
        
//        catchButton.addTarget(self, action: #selector(userCatchThePokemon(_:)), for: .touchUpInside)
    }
    
    override func setupRx() {
        super.setupRx()
        
        viewModel.name.bind(to: nameLabel.rx.text).disposed(by: disposeBag)
        viewModel.weight.bind(to: weightLabel.rx.text).disposed(by: disposeBag)
        viewModel.height.bind(to: heightLabel.rx.text).disposed(by: disposeBag)
        
        viewModel.existInBackpack.asObservable().bind { [weak self] catched in
            self?.catchButton.isHidden = catched
            }.disposed(by: disposeBag)
        
        viewModel.imagePath.asObservable().bind { [weak self] path in
            let url = URL(string: path)
            self?.pokemonImageView.kf.setImage(with: url)
            }.disposed(by: disposeBag)
    }

    @IBAction func userCatchThePokemon(_ sender: Any) {
        if viewModel.pokemon != nil {
            viewModel.catchCurrentPokemon()
        } else {
            viewModel.requestNewPokemon()
        }
    }
    
    @IBAction func userLeaveThePokemon(_ sender: Any) {
        print("leave")
    }
    
}
