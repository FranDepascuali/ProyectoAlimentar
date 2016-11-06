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
    
    private lazy var _donationDetailsView = DonationDetailsView.loadFromNib()!
    
    @IBOutlet weak var donationDetailsContainerView: UIView! {
        didSet {
            donationDetailsContainerView.backgroundColor = UIColor.clearColor()
        }
    }

    @IBOutlet weak var detailedInformationStackView: UIStackView! {
        didSet {
            detailedInformationStackView.hidden = true
        }
    }

    @IBOutlet weak var fetchDonationButton: UIButton! {
        didSet {
            fetchDonationButton.backgroundColor = ColorPalette.primaryColor
            fetchDonationButton.setTitleColor(.whiteColor(), forState: .Normal)
            fetchDonationButton.titleLabel?.setFont(pointSize: 14)
        }
    }
    
    public func bindViewModel(viewModel: DonationDetailViewModel) {
        fetchDonationButton.setTitle(viewModel.fetchDonationTitle, forState: .Normal)
        _donationDetailsView.bindViewModel(viewModel.donationDetailsViewModel)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        _donationDetailsView.loadInto(donationDetailsContainerView)
    }
}
