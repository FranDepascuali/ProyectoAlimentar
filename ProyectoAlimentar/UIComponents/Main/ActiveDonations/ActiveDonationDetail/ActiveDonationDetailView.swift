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
    
    public private(set) lazy var donationDetailsView = DonationDetailsView.loadFromNib()!
    
    @IBOutlet weak var titleContainerView: UIView! {
        didSet {
            titleContainerView.backgroundColor = .clearColor()
            TitleView(title: "Detalle").loadInto(titleContainerView)
        }
    }
    
    @IBOutlet weak var TimeLeftContainerView: UIView! {
        didSet{
            TimeLeftContainerView.backgroundColor = .clearColor()
        }
    }
    
    @IBOutlet weak var donationDetailsContainerView: UIView! {
        didSet {
            donationDetailsContainerView.backgroundColor = .clearColor()
            donationDetailsView.loadInto(donationDetailsContainerView)
        }
    }
    
    @IBOutlet weak var donationDescriptionContainerView: UIView! {
        didSet {
            donationDescriptionContainerView.backgroundColor = .clearColor()
            DonationDescriptionView.loadFromNib()!.loadInto(donationDescriptionContainerView)
        }
    }
}
