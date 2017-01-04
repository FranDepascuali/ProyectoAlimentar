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

extension Donation {
    
    static func fakedDonation(index: Double) -> Donation {
        return Donation(placeName: "Nombre del lugar", distance: index, placeDirection: "Direccion", from: "09:00", to: "22:00")
    }
    
    static var fakedDonations: [Donation] {
        return [1,2,3,4,5,6].map(fakedDonation)
    }
    
}

public struct FakedDonationsRepository: DonationRepositoryType {
    
    public func fetchDonations() -> SignalProducer<[Donation], NoError> {
        let donations = Donation.fakedDonations
        
        return SignalProducer(value: donations).delay(4, onScheduler: QueueScheduler())
    }
    
    public func fetchDonationsWithLocation() -> SignalProducer<[LocatedDonation], NoError> {
        let annotations = [BuenosAires, BuenosAires2, BuenosAires3, BuenosAires4, BuenosAires5]
        let fakedDonations = Array(zip(Donation.fakedDonations,annotations))

        return SignalProducer(value: fakedDonations).delay(4, onScheduler: QueueScheduler())
    }
}


