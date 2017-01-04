//
//  ProgrammaticViewType.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public protocol ProgrammaticViewType {
    
    static func programatic() -> Self
    
}

extension UIView: ProgrammaticViewType {
    
    public static func programatic() -> Self {
        let view = self.init(frame: CGRectZero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
}
