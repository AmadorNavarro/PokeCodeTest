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
    var font = BehaviorSubject(value: UIFont())
    var textColor = BehaviorSubject(value: UIColor.white)
    var backgroundColor = BehaviorSubject(value: UIColor.red)
    
    func setUp(text: String, font: UIFont = UIFont.boldSystemFont(ofSize: 16), textColor: UIColor = .white, backgroundColor: UIColor = .red) {
        self.text.onNext(text)
        self.textColor.onNext(textColor)
        self.font.onNext(font)
        self.backgroundColor.onNext(backgroundColor)
    }
    
}
