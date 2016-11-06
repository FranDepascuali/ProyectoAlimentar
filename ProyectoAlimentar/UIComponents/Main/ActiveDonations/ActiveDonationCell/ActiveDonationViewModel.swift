//
//  ActiveDonationCellViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/4/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation

public final class ActiveDonationViewModel {
    
    public let donationDetailsViewModel: DonationDetailsViewModel
    
    public init(donation: Donation) {
        donationDetailsViewModel = DonationDetailsViewModel(donation: donation)
    }

}
