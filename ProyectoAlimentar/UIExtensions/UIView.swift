//
//  UIView.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public enum Direction {
    case top, right, left, bottom
}

public extension UIView {

    public func addBorder(to direction: Direction, filledWith color: UIColor, width: CGFloat) {
        switch direction {
        case .top: addTopBorder(filledWith: color, width: width)
        case .right: addRightBorder(filledWith: color, width: width)
        case .left: addLeftBorder(filledWith: color, width: width)
        case .bottom: addBottomBorder(filledWith: color, width: width)
        }
    }

}

private extension UIView {

    func addTopBorder(filledWith color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
        layer.addSublayer(border)
    }

    func addRightBorder(filledWith color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: frame.size.width - width, y: 0, width: width, height: frame.size.height)
        layer.addSublayer(border)
    }

    func addBottomBorder(filledWith color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: frame.size.height - width, width: frame.size.width, height: width)
        layer.addSublayer(border)
    }

    func addLeftBorder(filledWith color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: frame.size.height)
        layer.addSublayer(border)
    }

}
