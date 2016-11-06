//
//  DonationRecordsViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/29/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import ReactiveCocoa

public final class DonationsRecordsViewModel {
    
    private let _donationRepository: DonationRepositoryType
    
    private let _donations: MutableProperty<[DonationRecordViewModel]>
    
    public init(donationRepository: DonationRepositoryType) {
        _donations = MutableProperty([])
        _donationRepository = donationRepository
    }
    
    public func count() -> Int {
        return _donations.value.count
    }
    
    public subscript(index: Int) -> DonationRecordViewModel {
        return _donations.value[index]
    }
}
