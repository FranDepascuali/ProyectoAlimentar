//
//  LoginViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/20/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import ReactiveSwift
import enum Result.NoError

public final class LoginViewModel {

    fileprivate let _userRepository: UserRepositoryType
    
    public init(userRepository: UserRepositoryType) {
        _userRepository = userRepository
    }
    
    public func login(_ token: String) -> SignalProducer<(), NoError> {
        return _userRepository
                .login(token)
                .map { _ in () }
                .observe(on: UIScheduler())
    }
}
