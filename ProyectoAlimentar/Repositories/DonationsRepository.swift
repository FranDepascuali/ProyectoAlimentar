//
//  DonationRepository.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/6/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import ReactiveCocoa
import enum Result.NoError

public protocol DonationRepositoryType {
    
    func fetchDonations() -> SignalProducer<[Donation], NoError>
    
    func fetchDonationsWithLocation() -> SignalProducer<[LocatedDonation], NoError>
    
}

public struct FakedDonationsRepository: DonationRepositoryType {
    
    public func fetchDonations() -> SignalProducer<[Donation], NoError> {
        let donations =
            [1,2,3,4,5,6].map(Donation.init)
        
        return SignalProducer(value: donations).delay(4, onScheduler: QueueScheduler())
    }
    
    public func fetchDonationsWithLocation() -> SignalProducer<[LocatedDonation], NoError> {
        let annotations = [BuenosAires, BuenosAires2, BuenosAires3, BuenosAires4, BuenosAires5]
        
        let fakedDonations = annotations.enumerate().map { LocatedDonation(donation: Donation(id: $0), annotation: $1 )}
        
        return SignalProducer(value: fakedDonations).delay(4, onScheduler: QueueScheduler())
    }
}
