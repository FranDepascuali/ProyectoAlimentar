//
//  UITabBarExtension.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/25/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public extension UITabBar {
    
    public func selectItemAt(index: Int) {
        selectedItem = items![index]
    }
    
    public func indexForItem(item: UITabBarItem) -> Int? {
        for (index, _item) in items!.enumerate() {
            if _item == item {
                return index
            }
        }
        return nil
    }
    
}