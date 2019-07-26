//
//  ServiceError.swift
//  O-Results
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

struct NetworkError {
    
    var code: String
    var title: String
    var message: String
    
    init(code: String = "", title: String = "", message: String = "") {
        self.code = code
        self.title = title
        self.message = message
    }
    
}
