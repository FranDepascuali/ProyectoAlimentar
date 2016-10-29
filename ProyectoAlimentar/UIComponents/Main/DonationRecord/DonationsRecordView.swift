//
//  DonationRecordsView.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/29/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import Core

public final class DonationsRecordView: UIView, NibLoadable {
    
    @IBOutlet weak var titleView: UIView! {
        didSet {
            titleView.backgroundColor = ColorPalette.primaryColor
        }
    }
    
    @IBOutlet weak var donationsRecordCollectionView: UICollectionView! {
        didSet {
            donationsRecordCollectionView.backgroundColor = ColorPalette.clearBackgroundColor
        }
    }
}
