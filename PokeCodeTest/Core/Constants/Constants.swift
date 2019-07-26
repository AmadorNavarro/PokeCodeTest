//
//  Constants.swift
//  O-Results
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import UIKit

struct Constants {
    //MARK: Global constants
    public static let hourSeconds: Int = 3600
    public static let minuteSeconds: Int = 60
    
    //MARK: DateFormatters
    public static let dateAndTimeFormat = "dd/MM/yyyy HH:mm:ss"
    public static let dateFormat = "dd/MM/yyyy"
    public static let timeFormat = "HH:mm:ss"
    public static let timeWithoutHoursFormat = "mm:ss"
    
    //MARK: - UI Constansts
    public static let zero: CGFloat = 0.0
    public static let sectionHorizontalMargin: CGFloat = 20.0
    public static let sectionVerticalMargin: CGFloat = 5.0
    public static let cornerRadii = CGSize(width: 10.0, height: 10.0)
    
    //MARK: - Animation
    public static let standardAnimationTime: TimeInterval = 0.5
    public static let shortAnimationTime: TimeInterval = 0.2
    
    //MARK: - CoreData
    public static let coreDataModelName = "Model"
    
}

