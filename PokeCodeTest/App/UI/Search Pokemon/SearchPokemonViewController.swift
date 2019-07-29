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
    @IBOutlet weak var leaveButton: UIButton!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if viewModel.pokemon.value == nil {
            viewModel.requestNewPokemon()
        }
    }
    
    override func createViewModel() -> SearchPokemonViewModel {
        return SearchPokemonViewModel()
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
        
        viewModel.addBackpack.onExecute { [weak self] in
            if let tabBar = self?.tabBarController as? PokedexTabBarController {
                tabBar.addBackpackItem()
            }
            }.disposed(by: disposeBag)
        
        viewModel.pokemon.asObservable().bind { [weak self] pokemon in
            guard let `self` = self else { return }
            if pokemon == nil {
                self.leaveButton.isHidden = true
                self.catchButton.setTitle("PokeCodeTest_search_view_catchbutton_search_title".localized, for: .normal)
            } else {
                self.leaveButton.isHidden = false
                self.catchButton.setTitle("PokeCodeTest_search_view_catchbutton_catch_title".localized, for: .normal)
            }
        }.disposed(by: disposeBag)
    }

    @IBAction func userCatchThePokemon(_ sender: Any) {
        if viewModel.pokemon.value != nil {
            viewModel.catchCurrentPokemon()
        } else {
            viewModel.requestNewPokemon()
        }
    }
    
    @IBAction func userLeaveThePokemon(_ sender: Any) {
        self.viewModel.clearPokemon()
    }
    
    override func manageActionError(error: APINetworkError, notNetworkAvailableAction: UIAlertAction? = nil) {
        switch error.code {
        case 404:
            showAlertController(message: "PokeCodeTest_search_view_pokemon_not_found".localized)
        case 408:
            showAlertController(message: error.message)
        default:
            break
        }
    }
    
}
