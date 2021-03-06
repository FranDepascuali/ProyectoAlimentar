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
    case TimeOpenedIcon = "img_donation_time"
    case LocationIcon = "img_donation_location"
    case Chronometer = "img_chronometer"
    case BigChronometer = "big_img_chronometer"
}

public enum CellIdentifier: String {
    case DonationRecordCell
    case ActiveDonationCell
    case DonationDetailCell
}

public extension UICollectionView {
    
    public func registerCell(_ identifier: CellIdentifier) {
        register(UINib(nibName: identifier.rawValue, bundle: nil), forCellWithReuseIdentifier: identifier.rawValue)
    }
    
    public func dequeCellWithIdentifier<CellType: UICollectionViewCell>(_ identifier: CellIdentifier, forIndexPath indexPath: IndexPath) -> CellType {
        return dequeueReusableCell(withReuseIdentifier: identifier.rawValue, for: indexPath) as! CellType
    }
    
    public func dequeCellWithIdentifier<CellType: UICollectionViewCell>(_ identifier: CellIdentifier, forIndexPath index: Int) -> CellType {
        return dequeCellWithIdentifier(identifier, forIndexPath: IndexPath(item: index, section: 0))
    }
    
    
}


public extension UIImage {

    convenience init(identifier: ImageAssetIdentifier) {
        self.init(named:identifier.rawValue)!
    }
}
