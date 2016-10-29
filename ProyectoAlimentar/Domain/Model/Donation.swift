//
//  Donation.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/17/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation

public struct Donation {

    public let placeName: String = "Nombre del lugar"

    public let distance: Double = 0.8

    public let placeDirection: String = "Dirección"

    public let from: String = "09:00"

    public let to: String = "22:00"

    private let _id: Int

    public init(id: Int) {
        _id = id
    }
}

extension Donation: Equatable {

}

public func ==(lhs: Donation, rhs: Donation) -> Bool {
    return
        lhs.distance == rhs.distance &&
        lhs.placeName == rhs.placeName &&
        lhs.placeDirection == rhs.placeDirection &&
        lhs.from == rhs.from &&
        lhs.to == rhs.to &&
        lhs._id == rhs._id
}
