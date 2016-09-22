//
//  UILabelExtension.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/21/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public extension UILabel {
    
    public func addCharactersSpacing(spacing: CGFloat) {
        let attributedString = NSMutableAttributedString(string: text!)
        attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSMakeRange(0, text!.characters.count))
        attributedText = attributedString
    }
}