//
//  UICollectionView.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/5/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public extension UICollectionView {

//    public func dequeueReusableCellWithIdentifier<CollectionViewCell: UICollectionViewCell>(identifier: CellIdentifier, forIndexPath indexPath: NSIndexPath) -> CollectionViewCell {
//        return self.dequeueReusableCellWithReuseIdentifier(identifier.rawValue, forIndexPath: indexPath) as! CollectionViewCell
//    }
//
//    public func registerCell(identifier: CellIdentifier) {
//        self.registerNib(UINib(nibName: identifier.rawValue, bundle: nil), forCellWithReuseIdentifier: identifier.rawValue)
//    }

    public var centerPoint: CGPoint {
        return CGPoint(x: self.center.x + self.contentOffset.x, y: self.center.y + self.contentOffset.y)
    }

    var centerCellIndexPath: NSIndexPath? {
        if let centerIndexPath: NSIndexPath  = self.indexPathForItemAtPoint(self.centerPoint) {
            return centerIndexPath
        }
        return nil
    }
}
