//
//  FontPalette.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/21/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit


public enum RobotoFont: String {
    case Medium = "Roboto-Medium"
}

public extension UILabel {
    
    public func setFont(type: RobotoFont = .Medium, pointSize: Float? = nil) {
        let size = pointSize ?? Float(self.font.pointSize)
        self.font = UIFont(type: type, pointSize: size)
        self.sizeToFit()
    }
    
}

public extension UITextView {
    
    public func setFont(type: RobotoFont = .Medium, pointSize: Float? = nil) {
        let size = pointSize ?? Float(self.font!.pointSize)
        self.font = UIFont(type: type, pointSize: size)
        self.sizeToFit()
    }
    
}

public extension UIFont {
    
    public convenience init(type: RobotoFont, pointSize: Float) {
        self.init(name: type.rawValue, size: CGFloat(pointSize))!
    }
    
}