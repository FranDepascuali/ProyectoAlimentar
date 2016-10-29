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

public enum CellIdentifier: String {
    case DonationRecordCell
    case ActiveDonationCell
    case DonationDetailCell
}

public extension UICollectionView {
    
    public func registerCell(identifier: CellIdentifier) {
        registerNib(UINib(nibName: identifier.rawValue, bundle: nil), forCellWithReuseIdentifier: identifier.rawValue)
    }
    
    public func dequeCellWithIdentifier<CellType: UICollectionViewCell>(identifier: CellIdentifier, forIndexPath indexPath: NSIndexPath) -> CellType {
        return dequeueReusableCellWithReuseIdentifier(identifier.rawValue, forIndexPath: indexPath) as! CellType
    }
    
    public func dequeCellWithIdentifier<CellType: UICollectionViewCell>(identifier: CellIdentifier, forIndexPath index: Int) -> CellType {
        return dequeCellWithIdentifier(identifier, forIndexPath: NSIndexPath(forItem: index, inSection: 0))
    }
    
    
}


public extension UIImage {

    convenience init(identifier: ImageAssetIdentifier) {
        self.init(named:identifier.rawValue)!
    }
}
