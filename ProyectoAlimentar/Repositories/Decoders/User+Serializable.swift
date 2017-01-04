//
//  UserDecoder.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/27/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import Result

extension User: Deserializable {
    
    public static func serialize(JSON: AnyObject) -> Result<User, SerializerErrorType> {
        
        let _email: Result<String, SerializerErrorType> = JSON >>> "email"
        let _name: Result<String, SerializerErrorType> = JSON >>> "name"
        let _username: Result<String, SerializerErrorType> = JSON >>> "username"
        
        guard
            let email = _email.value,
            let name = _name.value,
            let username = _username.value else {
                print("Error deserializing User")
                return Result(error: SerializerErrorType.AbsentKey(""))
        }
        
    
        return Result(User(email: email, userName: username, name: name))
    }
}

infix operator >>> { associativity left precedence 160 }

public func >>><ValueType>(JSON: AnyObject, key: String) -> Result<ValueType, SerializerErrorType> {
    guard let value = JSON[key] as? ValueType else {
        return Result(error: SerializerErrorType.AbsentKey(key))
    }
    
    return Result(value)
}
