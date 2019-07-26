//
//  BaseViewModel.swift
//  O-Results
//
//  Created by Amador Navarro on 11/03/2018.
//  Copyright © 2018 AmadorNavarro. All rights reserved.
//

import Foundation
import RxSwift
import Action
import Alamofire

enum ViewModelState: String {
    case idle = "idle", loading = "loading", loaded = "loaded"
}

enum Reachability {
    case unknown, notReachable, wifi, wwan
}

class BaseViewModel {
    
    private var networkReachabilityManager = NetworkReachabilityManager()
    
    var wireframe = BaseWireframe()
    var disposeBag = DisposeBag()
    var state = ViewModelState.idle
    var reachability = Reachability.unknown
    
    let reloadAction = CocoaAction { return .empty() }
    let notInternetConnection = CocoaAction { return .empty() }
    let actionError: Action<APINetworkError, APINetworkError> = Action { element in
        return Observable.create({ observer -> Disposable in
            observer.onNext(element)
            observer.onCompleted()
            return Disposables.create()
        })
    }
    let actionSuccess: Action<Any?, Any?> = Action { element in
        return Observable.create({ observer -> Disposable in
            observer.onNext(element)
            observer.onCompleted()
            return Disposables.create()
        })
    }
    let showLoadingAction: Action<Visibility, Visibility> = Action { element in
        return Observable.create({ observer -> Disposable in
            observer.onNext(element)
            observer.onCompleted()
            return Disposables.create()
        })
    }
    
    init() {
        startNetworkReachabilityObserver()
    }
    
    func setup(withPresenter presenter: UIViewController) {
        wireframe.presenterViewController = presenter
    }
    
    /// Override this method if you want to do something in the viewWillAppear of the ViewController
    func onViewWillAppear() {
    }
    
    func notReachable() {
        guard reachability != .notReachable else { return }
        
        reachability = .notReachable
    }
    
    func changeToWwanConnection() {
        guard reachability != .wwan else { return }
        
        reachability = .wwan
    }
    
    func changeToWifiConnection() {
        guard reachability != .wifi else { return }
        
        reachability = .wifi
    }
    
    func isNetworkAvailable() -> Bool {
        if let networkReachabilityManager = networkReachabilityManager {
            return networkReachabilityManager.isReachable
        }
        return false
    }
    
    private func startNetworkReachabilityObserver() {
        reachability = (networkReachabilityManager?.isReachable ?? false) ? .wwan : .notReachable
        networkReachabilityManager?.listener = { [weak self] reachability in
            guard let `self` = self else { return }
            
            switch reachability {
            case .notReachable, .unknown:
                self.notReachable()
            case .reachable(.wwan):
                self.changeToWwanConnection()
            case .reachable(.ethernetOrWiFi):
                self.changeToWifiConnection()
            }
        }
        networkReachabilityManager?.startListening()
    }
    
}
