//
//  UpperBannerViewModel.swift
//  PokeCodeTest
//
//  Created by Amador Navarro Lucas on 14/04/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import UIKit
import RxSwift

final class UpperBannerViewModel {
    
    var text = BehaviorSubject(value: "")
    var style = BehaviorSubject(value: ThemeStyle.textB16)
    var backgroundColor = BehaviorSubject(value: UIColor.white)
    
    func setUp(text: String, textStyle: ThemeStyle = .textB16, backgroundColor: UIColor = .white) {
        self.text.onNext(text)
        self.style.onNext(textStyle)
        self.backgroundColor.onNext(backgroundColor)
    }
    
}
