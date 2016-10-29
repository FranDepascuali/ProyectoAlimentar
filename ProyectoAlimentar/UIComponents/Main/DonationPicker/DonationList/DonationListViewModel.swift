//
//  DonationsListViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/21/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import ReactiveCocoa
import enum Result.NoError

public class DonationListViewModel {

    private let _donations: [Donation]

    private let _notifySelection: Donation -> ()

    // TODO: This should not be var
    public var selected: Signal<Int, NoError>!

    public var donationsCount: Int {
        return _donations.count
    }

    public init(donations: [Donation],
                externalSelection: Signal<Donation, NoError>,
                notifySelection: Donation -> ()) {

        _donations = donations
        _notifySelection = notifySelection
        selected = externalSelection
            .map { [unowned self] in self._donations.indexOf($0)! }
            .observeOn(UIScheduler())
    }

    public func selectDonationAt(index: Int) {
        _notifySelection(_donations[index])
    }
}
