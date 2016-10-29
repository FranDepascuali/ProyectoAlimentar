//
//  DonationDetailsViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/29/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation

public struct DonationDetailsViewModel {
    
    private let _donation: Donation
    
    public init(donation: Donation) {
        _donation = donation
    }
    
    public var placeName: String {
        return _donation.placeName
    }
    
    public var distance: String {
        return String(_donation.distance) + "km"
    }
    
    public var placeDirection: String {
        return _donation.placeDirection
    }
    
    public var from: String {
        return _donation.from
    }
    
    public var to: String {
        return _donation.to
    }
    
    public var timeOpened: String {
        return from + " - " + to
    }
    
}