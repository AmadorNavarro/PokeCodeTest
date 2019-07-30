//
//  PokedexTabBarController.swift
//  PokeCodeTest
//
//  Created by Amador Navarro on 27/07/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import UIKit
import RxSwift

final class PokedexTabBarController: UITabBarController {
    
    let recoveryBackPackUseCase = RecoveryBackpackPokemonsUseCaseImpl()
    var disposeBag = DisposeBag()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        configure()
    }
    
    func configure() {
        delegate = self
        tabBar.isTranslucent = false
        
        addSearchPokemonItem()
        checkBackpackPokemons()
    }
    
    func addSearchPokemonItem() {
        let searchPokemon = SearchPokemonViewController()
        searchPokemon.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        viewControllers = [searchPokemon]
    }
    
    func addBackpackItem() {
        if tabBar.items?.count == 1 {
            let backpackViewController = BackpackViewController()
            backpackViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
            
            let navigationController = UINavigationController(rootViewController: backpackViewController)
            navigationController.navigationBar.isTranslucent = true
            navigationController.navigationBar.barTintColor = .red
            navigationController.navigationBar.tintColor = .white
            navigationController.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            viewControllers?.append(navigationController)
        }
    }
    
    func checkBackpackPokemons() {
        _ = recoveryBackPackUseCase.execute()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe { [weak self] event in
                switch event {
                case .success(let response):
                    if !response.isEmpty {
                        self?.addBackpackItem()
                    }
                case .error(_):
                    break
                }
            }.disposed(by: disposeBag)
    }
    
}

extension PokedexTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let nav = viewController as? UINavigationController, let backpack = nav.topViewController as? BackpackViewController else { return }
        backpack.viewModel.recoveryBackPack()
    }
    
}
