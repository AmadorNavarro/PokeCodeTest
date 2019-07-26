//
//  Action+Utils.swift
//  O-Results
//
//  Created by Amador Navarro on 10/05/2019.
//  Copyright © 2019 AmadorNavarro. All rights reserved.
//

import Action
import RxSwift

extension Action {
    
    func onExecute(_ completion: @escaping () -> Void) -> Disposable {
        return self.executing.subscribe(onNext: { executing in
            if executing { completion() }
        })
    }
    
}
