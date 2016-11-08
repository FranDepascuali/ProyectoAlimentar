//
//  FacebookUserRepository.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/7/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import Foundation
import ReactiveCocoa
import enum Result.NoError
import FacebookCore
import FacebookLogin

public protocol FacebookUserRepositoryType: UserRepositoryType {
    
    func login(withPermissions: [ReadPermission]) -> SignalProducer<(), FacebookLoginError>
    
}

public class FacebookUserRepository: FacebookUserRepositoryType {
    
    private let _currentUser: MutableProperty<User?> = MutableProperty(nil)
    
    private let _loginManager = LoginManager()
    
    private let _isLoggedIn: MutableProperty<Bool> = {
        print(AccessToken.current)
        
        return MutableProperty(AccessToken.current != nil)
    }()
    
    public func login(withPermissions: [ReadPermission] = [.PublicProfile, .UserFriends, .Email]) -> SignalProducer<(), FacebookLoginError> {
        let loginProducer: FacebookProducer = _loginManager
                .logIn()
        
        return loginProducer
            .map { _ in () }
            .on(next: { [unowned self] _ in
                self._isLoggedIn.value = true })
    }
    
    public var isLoggedIn: AnyProperty<Bool> {
        return AnyProperty(_isLoggedIn)
    }
    
}
