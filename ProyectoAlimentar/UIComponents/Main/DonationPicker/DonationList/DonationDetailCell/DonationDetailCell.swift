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
    
    fileprivate lazy var _donationDetailsView: DonationDetailsView = DonationDetailsView.loadFromNib()!
    
    @IBOutlet weak var donationDetailsContainerView: UIView! {
        didSet {
            donationDetailsContainerView.backgroundColor = UIColor.clear
        }
    }

    @IBOutlet weak var detailedInformationStackView: UIStackView! {
        didSet {
            detailedInformationStackView.isHidden = true
        }
    }

    @IBOutlet weak var fetchDonationButton: UIButton! {
        didSet {
            fetchDonationButton.backgroundColor = ColorPalette.primaryColor
            fetchDonationButton.setTitleColor(.white, for: UIControlState())
            fetchDonationButton.titleLabel?.setFont(pointSize: 14)
        }
    }
    
    public func bindViewModel(_ viewModel: DonationDetailViewModel, onConfirmDonation: @escaping (Donation) -> ()) {
        fetchDonationButton.setTitle(viewModel.fetchDonationTitle, for: UIControlState())
        _donationDetailsView.bindViewModel(viewModel.donationDetailsViewModel)
        fetchDonationButton.setAction { _ in onConfirmDonation(viewModel.donation) }
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        _donationDetailsView.add(into:donationDetailsContainerView)
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        fetchDonationButton.setAction { _ in }
    }

}
