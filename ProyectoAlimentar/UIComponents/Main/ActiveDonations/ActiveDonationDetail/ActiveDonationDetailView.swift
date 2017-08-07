//
//  DonationDetailView.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/10/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import Core

public final class ActiveDonationDetailView: UIView, NibLoadable {
    
    public fileprivate(set) lazy var donationDetailsView: DonationDetailsView = DonationDetailsView.loadFromNib()!
    
    @IBOutlet weak var titleContainerView: UIView! {
        didSet {
            titleContainerView.backgroundColor = .clear
            TitleView(title: "Detalle").add(into: titleContainerView)
        }
    }
    
    @IBOutlet weak var TimeLeftContainerView: UIView! {
        didSet{
            TimeLeftContainerView.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var donationDetailsContainerView: UIView! {
        didSet {
            donationDetailsContainerView.backgroundColor = .clear
            donationDetailsView.add(into:donationDetailsContainerView)
        }
    }
    
    @IBOutlet weak var donationDescriptionContainerView: UIView! {
        didSet {
            donationDescriptionContainerView.backgroundColor = .clear
            let view: DonationDescriptionView = DonationDescriptionView.loadFromNib()!
            view.add(into: donationDescriptionContainerView)
        }
    }
}
