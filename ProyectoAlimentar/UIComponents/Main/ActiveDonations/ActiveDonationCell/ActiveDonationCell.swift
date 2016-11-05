//
//  ActiveDonationCell.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/4/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public final class ActiveDonationCell: UICollectionViewCell {
    
    // TODO: This should be a button
    @IBOutlet weak var cancelLabel: UILabel! {
        didSet {
            cancelLabel.setFont(pointSize: 14.0)
            cancelLabel.textColor = ColorPalette.secondaryTextColor
        }
    }
    
    @IBOutlet weak var timeLeftLabel: UILabel! {
        didSet {
            timeLeftLabel.setFont(pointSize: 32.0)
            timeLeftLabel.textColor = ColorPalette.primaryColor
        }
    }
    
    @IBOutlet weak var separatorView: UIView! {
        didSet {
            separatorView.backgroundColor = ColorPalette.secondaryTextColor
        }
    }
    
    @IBOutlet weak var chronometerImageView: UIImageView! {
        didSet {
            chronometerImageView.image = UIImage(identifier: .Chronometer)
        }
    }
    
    private lazy var _donationDetailsView = DonationDetailsView.loadFromNib()!
    
    @IBOutlet weak var donationDetailsContainerView: UIView! {
        didSet {
            donationDetailsContainerView.backgroundColor = .clearColor()
            _donationDetailsView.loadInto(donationDetailsContainerView)
        }
    }
    
    public func bindViewModel(viewModel: ActiveDonationCellViewModel) {
        _donationDetailsView.bindViewModel(viewModel.donationDetailsViewModel)
    }
}
