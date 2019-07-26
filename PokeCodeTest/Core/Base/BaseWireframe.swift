//
//  BaseWireframe.swift
//  O-Results
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import UIKit

class BaseWireframe {
    
    enum DisplayMode { case present, push, root }
    
    weak var presenterViewController: UIViewController!
    
    //MARK: - Private Func
    private func displayScreenMode(displayMode: DisplayMode, viewController: UIViewController) {
        switch displayMode {
        case .present:
            presenterViewController.present(viewController, animated: true, completion: nil)
        case .push:
            if let navigationController = presenterViewController.navigationController {
                navigationController.pushViewController(viewController, animated: true)
            }
        case .root:
            if let window = UIApplication.shared.keyWindow {
                window.rootViewController = viewController
                window.backgroundColor = .white
                window.makeKeyAndVisible()
            }
        }
    }
    
//    func displayCategoryList(forCompetition competition: Competition) {
//        let viewController = CategorySelectorViewController(competition: competition)
//        displayScreenMode(displayMode: .push, viewController: viewController)
//    }
//    
//    func displayResultList(forCompetition competition: Competition, category: Category) {
//        let viewController = RunnerListViewController(competition: competition, category: category)
//        displayScreenMode(displayMode: .push, viewController: viewController)
//    }
//    
//    func displayRunnerDetail(_ runner: ResultModel) {
//        let viewController = RunnerDetailViewController()
//        viewController.viewModel.setup(withRunner: runner)
//        displayScreenMode(displayMode: .push, viewController: viewController)
//    }
//    
//    func displayClubResults(_ competition: Int, clubName: String) {
//        let viewController = ClubListViewController(competition: competition, clubName: clubName)
//        displayScreenMode(displayMode: .push, viewController: viewController)
//    }
//    
//    func popClubListShowingRunnerDetail(_ runner: ResultModel) {
//        guard let navigationController = presenterViewController.navigationController else { return }
//        navigationController.popViewController(animated: true)
//        if let runnerDetailController = navigationController.topViewController as? RunnerDetailViewController {
//            runnerDetailController.viewModel.setup(withRunner: runner)
//        }
//    }
    
}
