//
//  UserRepository.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/28/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import ReactiveCocoa
import enum Result.NoError

public protocol UserRepositoryType {

    // TODO: This should not be commented. It isn't necessary now to know the user
//    var currentUser: AnyProperty<User?> { get }

    var isLoggedIn: AnyProperty<Bool> { get }
}

