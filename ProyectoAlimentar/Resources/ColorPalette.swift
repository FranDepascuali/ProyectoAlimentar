//
//  ColorPalette.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import Core

public protocol ColorPaletteType {

    static var primaryColor: UIColor { get }

    static var activatedColor: UIColor { get }

}

private extension UIColor {

    static let lightOrange = UIColor(hex: "FDB949")!

    static let darkOrange = UIColor(hex: "F39700")!
    
    static let lightGrey = UIColor(hex: "F2F2F2")!
}

public struct ColorPalette: ColorPaletteType {

    public static var primaryColor = UIColor.lightOrange

    public static var activatedColor = UIColor.darkOrange

    public static var primaryTextColor = UIColor.black

    public static var secondaryTextColor = UIColor(hex: "9b9b9b")!
    
    public static var clearBackgroundColor = UIColor.lightGrey
}
