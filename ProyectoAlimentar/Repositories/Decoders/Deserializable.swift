//
//  Decoder.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/25/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import Result

public enum SerializerErrorType: ErrorType {
    
    case AbsentKey(String)
    
}

public protocol Deserializable {
    
    static func serialize(JSON: AnyObject) -> Result<Self, SerializerErrorType>
}
