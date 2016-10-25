//
//  DonationDetailCell.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/5/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import Core

public final class DonationDetailCell: UICollectionViewCell {
    
    @IBOutlet weak var placeImageView: UIImageView!
    
    @IBOutlet weak var placeNameLabel: UILabel! {
        didSet {
            placeNameLabel.setFont(pointSize: 16.0)
            placeNameLabel.textColor = ColorPalette.primaryTextColor
        }
    }
    @IBOutlet weak var distanceToPlaceLabel: UILabel! {
        didSet {
            distanceToPlaceLabel.setFont(pointSize: 16)
            distanceToPlaceLabel.textColor = ColorPalette.primaryTextColor
        }
    }
    
    @IBOutlet weak var locationIconImageView: UIImageView!
    
    @IBOutlet weak var locationLabel: UILabel! {
        didSet {
            locationLabel.setFont(pointSize: 14)
            locationLabel.textColor = ColorPalette.secondaryTextColor
        }
    }
    
    @IBOutlet weak var timeOpenedImageView: UIImageView!
    @IBOutlet weak var timeOpenedLabel: UILabel! {
        didSet {
            timeOpenedLabel.setFont(pointSize: 14)
            timeOpenedLabel.textColor = ColorPalette.secondaryTextColor
        }
    }
    
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
            fetchDonationButton.titleLabel?.setFont(pointSize: 14)
        }
    }
}