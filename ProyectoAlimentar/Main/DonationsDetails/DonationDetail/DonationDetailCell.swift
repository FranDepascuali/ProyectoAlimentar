//
//  DonationDetailCell.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/5/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public final class DonationDetailCell: UICollectionViewCell {
    
    @IBOutlet weak var placeImageView: UIImageView!
    
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var distanceToPlaceLabel: UILabel!
    
    @IBOutlet weak var locationIconImageView: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var timeOpenedImageView: UIImageView!
    @IBOutlet weak var timeOpenedLabel: UILabel!
    
    @IBOutlet weak var detailedInformationStackView: UIStackView! {
        didSet {
            detailedInformationStackView.hidden = true
        }
    }
    
    
    @IBOutlet weak var fetchDonationButton: UIButton! {
        didSet {
            fetchDonationButton.setTitle("Buscar Donación", forState: .Normal)
            fetchDonationButton.backgroundColor = ColorPalette.primaryColor
            fetchDonationButton.setTitleColor(.whiteColor(), forState: .Normal)
        }
    }
}