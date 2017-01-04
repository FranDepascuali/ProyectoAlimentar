//
//  Decoder.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/25/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import Result

public enum DeserializerErrorType: ErrorType {
    
    case AbsentKey(String)
    
}

public protocol Deserializable {
    
    static func deserialize(JSON: AnyObject) -> Result<Self, DeserializerErrorType>
}
