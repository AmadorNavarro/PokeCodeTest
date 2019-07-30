//
//  UIImageView+Maps.swift
//  PokeCodeTest
//
//  Created by Amador Navarro Lucas on 05/01/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import UIKit

enum BackgroundMaps: String, CaseIterable {
    
    case map1, map2
    
    static func random<G: RandomNumberGenerator>(using generator: inout G) -> BackgroundMaps {
        return BackgroundMaps.allCases.randomElement(using: &generator) ?? .map1
    }
    
    static func random() -> BackgroundMaps {
        var g = SystemRandomNumberGenerator()
        return BackgroundMaps.random(using: &g)
    }
    
}

extension UIImageView {
    
    static func mapImage() -> UIImageView {
        let mapView = UIImageView(image: UIImage(named: BackgroundMaps.random().rawValue))
        mapView.contentMode = .scaleAspectFill
        mapView.alpha = 0.3
        
        return mapView
    }
    
}
