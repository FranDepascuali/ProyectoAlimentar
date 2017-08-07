//
//  DonationRecordCell.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/29/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public final class DonationRecordCell: UICollectionViewCell {
    
    fileprivate lazy var _donationDetailsView: DonationDetailsView = DonationDetailsView.loadFromNib()!
    
    @IBOutlet weak var donationDetailsContainerView: UIView! {
        didSet {
            donationDetailsContainerView.backgroundColor = .clear
        }
    }
    
    public func bindViewModel(_ viewModel: DonationRecordViewModel) {
        _donationDetailsView.bindViewModel(viewModel.donationDetailsViewModel)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        _donationDetailsView.add(into:donationDetailsContainerView)
    }
    
}
