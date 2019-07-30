//
//  UIViewController+Utils.swift
//  Seat
//
//  Created by Gary  Dos Santos on 08/09/2017.
//  Copyright © 2017 BeRepublic. All rights reserved.
//

import UIKit

enum Visibility { case visible, gone }

extension UIViewController {
    
    func progressVisibility(visibility: Visibility) {
        switch visibility {
        case .visible:
            self.view.showProgressHUD()
        case .gone:
            self.view.hideProgressHUD()
        }
    }
    
    func showAlert(error: APINetworkError) {
        showAlertController(title: error.title, message: error.message, buttonTitle: "PokeCodeTest_alert_accept_button".localized, style: .cancel)
    }
    
    func showAlertController(title: String? = "PokeCodeTest_alert_information_title".localized, message: String, buttonTitle: String? = "PokeCodeTest_alert_accept_button".localized, buttonAction: UIAlertAction? = nil, style: UIAlertAction.Style? = .cancel, secondButton: UIAlertAction? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let buttonAction = buttonAction {
            alertController.addAction(buttonAction)
        } else {
            let defaultAction = UIAlertAction(title: buttonTitle, style: style ?? .cancel, handler: nil)
            alertController.addAction(defaultAction)
        }
        
        if let secondButton = secondButton {
            alertController.addAction(secondButton)
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}
