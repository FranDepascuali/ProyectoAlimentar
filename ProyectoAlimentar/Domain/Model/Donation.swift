//
//  Donation.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/17/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation

public struct Donation {

    public let placeName: String

    public let distance: Double

    public let placeDirection: String

    public let from: String

    public let to: String

}

extension Donation: Equatable {

}

public func ==(lhs: Donation, rhs: Donation) -> Bool {
    return
        lhs.distance == rhs.distance &&
        lhs.placeName == rhs.placeName &&
        lhs.placeDirection == rhs.placeDirection &&
        lhs.from == rhs.from &&
        lhs.to == rhs.to 
}
