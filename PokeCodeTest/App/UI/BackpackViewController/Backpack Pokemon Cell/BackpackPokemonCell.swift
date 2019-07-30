//
//  BackpackPokemonCell.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 29/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import UIKit
import RxSwift
import Kingfisher

final class BackpackPokemonCell: UICollectionViewCell {

    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let cellHeight: CGFloat = 0.0
    
    var disposeBag = DisposeBag()
    var viewModel = BackpackPokemonViewModel()
        
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()

        self.setupRx()
        self.setupLayout()
    }
    
    // MARK: - Setup
    func setupLayout() {
        self.backgroundColor = .white
        self.contentView.layer.cornerRadius = 4.0
        self.contentView.layer.masksToBounds = true
        
        self.layer.cornerRadius = 4.0
        self.layer.shadowColor = UIColor(red: 111.0/255.0, green: 127.0/255.0, blue: 134.0/255.0, alpha: 0.2).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        self.layer.shadowRadius = 6.0
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = 1.0
    }
    
    func setupRx() {
        disposeBag = DisposeBag()
        
        viewModel.name.bind(to: nameLabel.rx.text).disposed(by: disposeBag)
        viewModel.imagePath.asObservable().bind { [weak self] path in
            let url = URL(string: path)
            self?.pokemonImageView.kf.setImage(with: url)
            }.disposed(by: disposeBag)
    }
    
}

extension BackpackPokemonCell {
        
    class func preferredNibName() -> String {
        return String(describing: BackpackPokemonCell.self)
    }
    
}
