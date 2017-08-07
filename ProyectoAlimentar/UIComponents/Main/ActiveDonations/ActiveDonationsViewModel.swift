//
//  ActiveDonationsViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/24/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import ReactiveSwift

public final class ActiveDonationsViewModel {

    fileprivate let _donationRepository: DonationRepositoryType
    
    fileprivate let _activeDonations: MutableProperty<[ActiveDonationViewModel]>
    
    public init(donationRepository: DonationRepositoryType) {
        _donationRepository = donationRepository
        _activeDonations = MutableProperty([])
    }
    
    public func count() -> Int {
        return _activeDonations.value.count
    }
    
    public subscript(index: Int) -> ActiveDonationViewModel {
        return _activeDonations.value[index]
    }
}
