//
//  DonationRecordsViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/29/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation

public final class DonationsRecordsViewModel {
    
    // TODO: This should be private and a mutable property
    public let _donations: [Donation]
    
    public init(donations: [Donation]) {
        _donations = donations
    }
}