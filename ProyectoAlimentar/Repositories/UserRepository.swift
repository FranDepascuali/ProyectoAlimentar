//
//  UserRepository.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/28/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import ReactiveCocoa
import Alamofire
import enum Result.NoError

public protocol UserRepositoryType {
    
    func login(token: String) -> SignalProducer<User, NoError>
    
    var currentUser: AnyProperty<User?> { get }
    
}

public class UserRepository: UserRepositoryType {
    
    private let _networkManager: NetworkManager
    
    public init(networkManager: NetworkManager) {
        _networkManager = networkManager
    }
    
    private var _currentUser: MutableProperty<User?> = {
        return MutableProperty(KeychainService.sharedInstance.loadUser())
    }()
    
    public func login(token: String) -> SignalProducer<User, NoError> {
        return _networkManager
            .request(.POST,
                URL: "fb_connect",
                parameters: ["access_token": token])
            .flatMap(.Latest) {
                return SignalProducer(result: User.serialize($0))
            }
            .on(next: { [unowned self] in self.setCurrentUser($0) })
            .liftError()
    }
    
    public var currentUser: AnyProperty<User?> {
        return AnyProperty(_currentUser)
    }
    
    private func setCurrentUser(user: User) {
        _currentUser.value = user
        KeychainService.sharedInstance.saveUser(user)
    }
}

