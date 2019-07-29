//
//  UIView+ProgressHUD.swift
//  OnionArchitecture
//
//  Created by Erik Agujari on 14/08/2017.
//  Copyright © 2017 BeRepublic. All rights reserved.
//

import UIKit
import MBProgressHUD

private var progressHUDCounterAssociationKey: UInt8 = 0

extension UIView {
    
    private var progressHUDCounter: Int {
        get {
            if let counter = objc_getAssociatedObject(self, &progressHUDCounterAssociationKey) as? Int {
                return counter
            } else {
                objc_setAssociatedObject(self, &progressHUDCounterAssociationKey, 0, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
                return 0
            }
        }
        set(newValue) {
            objc_setAssociatedObject(self, &progressHUDCounterAssociationKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    func showProgressHUD() {
        guard progressHUDCounter == 0 else {
            progressHUDCounter += 1
            return
        }
        
        let loadingNotification = MBProgressHUD.showAdded(to: self, animated: true)
        loadingNotification.mode = .indeterminate
        loadingNotification.backgroundView.color = ThemeColor.lightGray.color().withAlphaComponent(0.7)
        loadingNotification.bezelView.color = ThemeColor.ultraLightGray.color()
        loadingNotification.label.text = "PokeCodeTest_spinner_loading_text".localized
        progressHUDCounter += 1
    }
    
    func hideProgressHUD() {
        if progressHUDCounter > 0 {
            progressHUDCounter -= 1
            if progressHUDCounter == 0 {
                MBProgressHUD.hide(for: self, animated: true)
            }
        }
    }
    
}
