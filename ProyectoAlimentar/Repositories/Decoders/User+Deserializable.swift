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
    
    public static func deserialize(_ JSON: AnyObject) -> Result<User, DeserializerErrorType> {
        
        let _email: Result<String, DeserializerErrorType> = JSON >>> "email"
        let _name: Result<String, DeserializerErrorType> = JSON >>> "name"
        let _username: Result<String, DeserializerErrorType> = JSON >>> "username"
        
        guard
            let email = _email.value,
            let name = _name.value,
            let username = _username.value else {
                print("Error deserializing User")
                return Result(error: DeserializerErrorType.absentKey(""))
        }
        
    
        return Result(User(email: email, userName: username, name: name))
    }
}

infix operator >>>: JSONValueGetter

precedencegroup JSONValueGetter {
    associativity: left
}

public func >>><ValueType>(JSON: AnyObject, key: String) -> Result<ValueType, DeserializerErrorType> {
    guard let value = JSON[key] as? ValueType else {
        return Result(error: DeserializerErrorType.absentKey(key))
    }
    
    return Result(value)
}
