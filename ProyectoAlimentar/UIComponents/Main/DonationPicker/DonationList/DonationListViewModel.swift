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

    public let donations: AnyProperty<[DonationDetailViewModel]>
    
    private let _notifySelection: Donation -> ()

    // TODO: This should not be var
    public var selected: Signal<Int, NoError>!

    public var donationsCount: Int {
        return donations.value.count
    }

    public init(donations: AnyProperty<[Donation]>,
                externalSelection: Signal<Int, NoError>,
                notifySelection: Donation -> ()) {

        self.donations = donations.map { $0.map(DonationDetailViewModel.init) }
        _notifySelection = notifySelection
        selected = externalSelection
            .observeOn(UIScheduler())
    }

    public func selectDonationAt(index: Int) {
        _notifySelection(donations.value[index].donation)
    }
    
    public subscript(index: Int) -> DonationDetailViewModel {
        return donations.value[index]
    }
    
}
