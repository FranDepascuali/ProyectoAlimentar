//
//  DonationsListViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/21/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import ReactiveSwift
import enum Result.NoError

open class DonationListViewModel {

    open let donations: Property<[DonationDetailViewModel]>
    
    fileprivate let _notifySelection: (Donation) -> ()

    // TODO: This should not be var
    open var selected: Signal<Int, NoError>!

    open var donationsCount: Int {
        return donations.value.count
    }

    public init(donations: Property<[Donation]>,
                externalSelection: Signal<Int, NoError>,
                notifySelection: @escaping (Donation) -> ()) {

        self.donations = donations.map { $0.map(DonationDetailViewModel.init) }
        _notifySelection = notifySelection
        selected = externalSelection
            .observe(on: UIScheduler())
    }

    open func selectDonationAt(_ index: Int) {
        _notifySelection(donations.value[index].donation)
    }
    
    open subscript(index: Int) -> DonationDetailViewModel {
        return donations.value[index]
    }
    
}
