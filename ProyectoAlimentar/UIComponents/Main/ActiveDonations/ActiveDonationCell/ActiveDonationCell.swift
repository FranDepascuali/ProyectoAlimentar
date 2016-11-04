//
//  ActiveDonationCell.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/4/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public final class ActiveDonationCell: UICollectionViewCell {
    
    @IBOutlet weak var separatorView: UIView! {
        didSet {
            separatorView.backgroundColor = ColorPalette.secondaryTextColor
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