//
//  ActiveDonationsViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/24/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public final class ActiveDonationsViewModel {
    
    // TODO: This should be private and a mutable property
    public let _donations: [Donation]
    
    public init(donations: [Donation]) {
        _donations = donations
    }
}
