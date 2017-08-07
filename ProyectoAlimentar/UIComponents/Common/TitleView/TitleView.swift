//
//  TitleView.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import Cartography

private let StatusBarHeight: CGFloat = 20.0

public final class TitleView: UIView {
    
    fileprivate lazy var _titleLabel: UILabel = {
        self.addSubview($0)
        
        $0.setFont(pointSize: 20)
        $0.textColor = .white
        
        constrain($0) { label in
            label.height == label.superview!.height - StatusBarHeight
            label.bottom == label.superview!.bottom
            label.centerX == label.superview!.centerX
        }
        
        return $0
        
    }(UILabel.programatic())
    
    public init(backgroundColor: UIColor = ColorPalette.primaryColor, title: String) {
        super.init(frame: CGRect.zero)
        
        self.backgroundColor = backgroundColor
        _titleLabel.text = title
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

