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

    private static let lightOrange = UIColor(hex: "FDB949")!

    private static let darkOrange = UIColor(hex: "F39700")!
    
    private static let lightGrey = UIColor(hex: "F2F2F2")!
}

public struct ColorPalette: ColorPaletteType {

    public static var primaryColor = UIColor.lightOrange

    public static var activatedColor = UIColor.darkOrange

    public static var primaryTextColor = UIColor.blackColor()

    public static var secondaryTextColor = UIColor(hex: "9b9b9b")!
    
    public static var clearBackgroundColor = UIColor.lightGrey
}
