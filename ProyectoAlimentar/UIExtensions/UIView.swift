//
//  UIView.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public enum Direction {
    case Top, Right, Left, Bottom
}

public extension UIView {

    public func addBorder(to direction: Direction, filledWith color: UIColor, width: CGFloat) {
        switch direction {
        case .Top: addTopBorder(filledWith: color, width: width)
        case .Right: addRightBorder(filledWith: color, width: width)
        case .Left: addLeftBorder(filledWith: color, width: width)
        case .Bottom: addBottomBorder(filledWith: color, width: width)
        }
    }

}

private extension UIView {

    private func addTopBorder(filledWith color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.CGColor
        border.frame = CGRectMake(0, 0, frame.size.width, width)
        layer.addSublayer(border)
    }

    private func addRightBorder(filledWith color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.CGColor
        border.frame = CGRectMake(frame.size.width - width, 0, width, frame.size.height)
        layer.addSublayer(border)
    }

    private func addBottomBorder(filledWith color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.CGColor
        border.frame = CGRectMake(0, frame.size.height - width, frame.size.width, width)
        layer.addSublayer(border)
    }

    private func addLeftBorder(filledWith color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.CGColor
        border.frame = CGRectMake(0, 0, width, frame.size.height)
        layer.addSublayer(border)
    }

}
