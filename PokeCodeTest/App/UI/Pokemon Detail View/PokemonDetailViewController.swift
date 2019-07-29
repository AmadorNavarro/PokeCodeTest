//
//  PokemonDetailViewController.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 30/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

final class PokemonDetailViewController: BaseViewController<PokemonDetailViewModel> {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typesLabel: UILabel!
    @IBOutlet weak var weightTitleLabel: UILabel!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var heightTitleLabel: UILabel!
    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var baseExperienceTitleLabel: UILabel!
    @IBOutlet weak var baseExperienceValueLabel: UILabel!
    @IBOutlet weak var catchedDateLabel: UILabel!
    
    override func createViewModel() -> PokemonDetailViewModel {
        return PokemonDetailViewModel()
    }
    
    override func setupLayout() {
        super.setupLayout()
        
    }
    
    override func setupRx() {
        super.setupRx()
        
        viewModel.types.bind(to: typesLabel.rx.text).disposed(by: disposeBag)
        viewModel.weightTitle.bind(to: weightTitleLabel.rx.text).disposed(by: disposeBag)
        viewModel.weightValue.bind(to: weightValueLabel.rx.text).disposed(by: disposeBag)
        viewModel.heightTitle.bind(to: heightTitleLabel.rx.text).disposed(by: disposeBag)
        viewModel.heightValue.bind(to: heightValueLabel.rx.text).disposed(by: disposeBag)
        viewModel.baseExperienceTitle.bind(to: baseExperienceTitleLabel.rx.text).disposed(by: disposeBag)
        viewModel.baseExperienceValue.bind(to: baseExperienceValueLabel.rx.text).disposed(by: disposeBag)
        viewModel.catchedDate.bind(to: catchedDateLabel.rx.text).disposed(by: disposeBag)
        
        viewModel.imagePath.asObservable().bind { [weak self] path in
            let url = URL(string: path)
            self?.pokemonImageView.kf.setImage(with: url)
            }.disposed(by: disposeBag)
        
        viewModel.name.asObservable().bind { [weak self] name in
            self?.title = name
            self?.nameLabel.text = name
            self?.setupTitle()
            }.disposed(by: disposeBag)
    }
    
    override func navBarTitle() -> String {
        return nameLabel.text ?? ""
    }

}
