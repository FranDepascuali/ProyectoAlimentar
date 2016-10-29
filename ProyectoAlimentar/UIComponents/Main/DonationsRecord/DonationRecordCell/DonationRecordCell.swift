//
//  DonationRecordCell.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/29/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public final class DonationRecordCell: UICollectionViewCell {
    
    private lazy var _donationDetailsView = DonationDetailsView.loadFromNib()!
    
    @IBOutlet weak var donationDetailsContainerView: UIView! {
        didSet {
            donationDetailsContainerView.backgroundColor = .clearColor()
        }
    }
    
    public func bindViewModel(viewModel: DonationDetailCellViewModel) {
        _donationDetailsView.bindViewModel(viewModel.donationDetailsViewModel)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        _donationDetailsView.loadInto(donationDetailsContainerView)
    }
    
}