//
//  DonationRecordCellViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/29/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation

public struct DonationRecordViewModel {
    
    public let donationDetailsViewModel: DonationDetailsViewModel
    
    public init(donation: Donation) {
        donationDetailsViewModel = DonationDetailsViewModel(donation: donation)
    }
}
