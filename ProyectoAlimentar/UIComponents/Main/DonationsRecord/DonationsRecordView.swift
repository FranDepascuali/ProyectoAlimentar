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
    @IBOutlet weak var statusBar: UIView! {
        didSet {
            statusBar.backgroundColor = ColorPalette.primaryColor
        }
    }
    
    private lazy var _titleView = TitleView.init(title: "Historial")
    
    @IBOutlet weak var titleContainerView: UIView! {
        didSet {
            _titleView.loadInto(titleContainerView)
        }
    }
    
    @IBOutlet weak var donationsRecordCollectionView: UICollectionView! {
        didSet {
            donationsRecordCollectionView.backgroundColor = ColorPalette.clearBackgroundColor
        }
    }
}
