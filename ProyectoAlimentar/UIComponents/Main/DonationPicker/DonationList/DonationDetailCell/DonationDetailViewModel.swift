//
//  DonationDetailCellViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/29/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public final class DonationDetailViewModel {
    
    public let donationDetailsViewModel: DonationDetailsViewModel
    
    // TODO: This should not be stored
    public let donation: Donation
    
    public init(donation: Donation) {
        self.donation = donation
        donationDetailsViewModel = DonationDetailsViewModel(donation: donation)
    }
    
    // TODO: This should be localized
    public var fetchDonationTitle: String {
        return "Buscar donación"
    }

}
