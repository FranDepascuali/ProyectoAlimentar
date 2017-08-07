//
//  Decoder.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/25/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import Result

public enum DeserializerErrorType: Error {
    
    case absentKey(String)
    
}

public protocol Deserializable {
    
    static func deserialize(_ JSON: AnyObject) -> Result<Self, DeserializerErrorType>
}
