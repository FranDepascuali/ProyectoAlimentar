//
//  UserRepository.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/28/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import ReactiveCocoa

public protocol UserRepositoryType {
    
    var currentUser: AnyProperty<User?> { get }
    
}

public class UserRepository: UserRepositoryType {
    
    private let _currentUser: MutableProperty<User?> = MutableProperty(nil)
    
    // TODO: Change this
    public var currentUser: AnyProperty<User?> {
        return AnyProperty(_currentUser)
    }
}