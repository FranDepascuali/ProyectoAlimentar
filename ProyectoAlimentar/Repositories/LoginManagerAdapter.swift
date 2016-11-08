//
//  LoginManagerAdapter.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/7/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import ReactiveCocoa
import enum Result.NoError
import FacebookCore
import FacebookLogin

public typealias FacebookLoginResult = (Set<FacebookCore.Permission>, declinedPermissions: Set<FacebookCore.Permission>, token: FacebookCore.AccessToken)

public enum FacebookLoginError: ErrorType {
    case Cancelled
    case Failed(ErrorType)
}

public typealias FacebookProducer = SignalProducer<FacebookLoginResult, FacebookLoginError>

public extension LoginManager {
    
    public func logIn(
        loginBehavior: FacebookLogin.LoginBehavior = .Native,
        permissions: [FacebookCore.ReadPermission] = [.PublicProfile],
        OnTopOf viewController: UIViewController? = nil) -> FacebookProducer {
        
        return SignalProducer { observer, _ in
            self.logIn(permissions, viewController: viewController) { result in
                switch result {
                case .Success(let result):
                    observer.sendNext(result)
                    observer.sendCompleted()
                case .Cancelled:
                    observer.sendInterrupted()
                    
                case .Failed(let error):
                    observer.sendFailed(FacebookLoginError.Failed(error))
                }
            }
        }
    }
}
