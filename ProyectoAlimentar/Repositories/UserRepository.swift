//
//  UserRepository.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/28/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import ReactiveSwift
import Alamofire
import enum Result.NoError

public protocol UserRepositoryType {
    
    func login(_ token: String) -> SignalProducer<User, NoError>
    
    var currentUser: Property<User?> { get }
    
}

open class UserRepository: UserRepositoryType {
    
    fileprivate let _networkManager: NetworkManager
    
    public init(networkManager: NetworkManager) {
        _networkManager = networkManager
    }
    
    fileprivate var _currentUser: MutableProperty<User?> = {
        return MutableProperty(KeychainService.sharedInstance.loadUser())
    }()
    
    open func login(_ token: String) -> SignalProducer<User, NoError> {
        return .empty
//        return _networkManager
//            .request(.POST,
//                URL: "fb_connect",
//                parameters: ["access_token": token])
//            .flatMap(.latest) {
//                return SignalProducer(result: User.deserialize($0))
//            }
//            .on(next: { [unowned self] in self.setCurrentUser($0) })
//            .liftError()
    }
    
    open var currentUser: Property<User?> {
        return Property(_currentUser)
    }
    
    fileprivate func setCurrentUser(_ user: User) {
        _currentUser.value = user
        KeychainService.sharedInstance.saveUser(user)
    }
}

