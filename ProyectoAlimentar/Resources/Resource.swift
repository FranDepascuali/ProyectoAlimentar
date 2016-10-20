//
//  Resource.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/21/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public protocol Resource {
    
    var identifier: String { get }
    
}

public enum ImageAssetIdentifier: String {
    case OrderPin = "order_pin"
    case SelectedOrderPin = "selected_order_pin"
    case LoginBackgroundImage = "bg_login_ios"
    case LoginLogo = "img_login_logo_pa"
}


public extension UIImage {
    
    convenience init(identifier: ImageAssetIdentifier) {
        self.init(named:identifier.rawValue)!
    }
}