//
//  DonationDetailCellViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/29/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public final class DonationDetailCellViewModel {
    
    public let donationDetailsViewModel: DonationDetailsViewModel
    
    public init(donation: Donation) {
        donationDetailsViewModel = DonationDetailsViewModel(donation: donation)
    }
    
    // TODO: This should be localized
    public var fetchDonationTitle: String {
        return "Buscar donación"
    }
}