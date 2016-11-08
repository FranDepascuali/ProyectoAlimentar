//
//  LoginViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/20/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import ReactiveCocoa

public final class LoginViewModel {

    private let _userRepository: FacebookUserRepository
    
    public init(userRepository: FacebookUserRepository) {
        _userRepository = userRepository
    }
    
    public func login() -> SignalProducer<(), FacebookLoginError> {
        return
            _userRepository
                .login()
                .observeOn(UIScheduler())
    }
}
