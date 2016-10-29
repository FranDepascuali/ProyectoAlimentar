//
//  BaseDonationCell.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/29/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import Core

public final class DonationDetailsView: UIView, NibLoadable {
    
    @IBOutlet weak var placeImageView: UIImageView! {
        didSet {
            placeImageView.image = UIImage(named: "restaurant_placeholder")!
        }
    }
    
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
    
    public func bindViewModel(viewModel: DonationDetailsViewModel) {
        placeNameLabel.text = viewModel.placeName
        distanceToPlaceLabel.text = viewModel.distance
        locationLabel.text = viewModel.placeDirection
        timeOpenedLabel.text = viewModel.timeOpened
    }
}