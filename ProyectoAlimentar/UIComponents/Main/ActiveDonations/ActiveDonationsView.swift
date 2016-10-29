//
//  ActiveDonationsView.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/24/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import Core

public final class ActiveDonationsView: UIView, NibLoadable {

    @IBOutlet weak var activeDonationsCollectionView: UICollectionView! {
        didSet {
            activeDonationsCollectionView.backgroundColor = UIColor.grayColor()
        }
    }

}
