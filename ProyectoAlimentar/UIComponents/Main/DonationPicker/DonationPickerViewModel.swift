//
//  MainViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import ReactiveSwift
import Core
import Result

public typealias LocatedDonation = (Donation, MapViewAnnotation)

open class DonationPickerViewModel {

    fileprivate let _selectedDonation: MutableProperty<LocatedDonation?> = MutableProperty(.none)
    
    fileprivate let _locatedDonations: MutableProperty<[LocatedDonation]>
    
    fileprivate var _donations: Property<[Donation]> {
        let extractDonations: ([LocatedDonation]) -> [Donation] =
            { $0.map { $0.0 } }
        
        return Property(_locatedDonations).map(extractDonations)
    }
    
    fileprivate var _annotations: Property<[MapViewAnnotation]> {
        
        let extractAnnotations: ([LocatedDonation]) -> [MapViewAnnotation] =
            { $0.map { $0.1 } }
        
        return Property(_locatedDonations).map(extractAnnotations)
    }
    
    fileprivate let _donationRepository: DonationRepositoryType

    public init(donationRepository: DonationRepositoryType) {
        _locatedDonations = MutableProperty([])
        _donationRepository = donationRepository
    }

    open func mapViewModel() -> MapViewModel {
        let selectedForMap = _selectedDonation
                .signal
                .skipNil()
                .map { $0.1 }

        let mapViewModel = MapViewModel(
            annotations: _annotations,
            externalSelection: selectedForMap) { [unowned self] annotation in
                guard !self.isAlreadySelected(annotation) else {
                    print("Annotation already selected")
                    return
                }

                self._selectedDonation.value = self._locatedDonations.value.first(where: { $0.1 == annotation })!
        }

        return mapViewModel

    }

    open func donationListViewModel() -> DonationListViewModel {
        
        let selectedIndex = _selectedDonation
            .signal
            .skipNil()
            .map { [unowned self] locatedDonation in
                self._locatedDonations.value.index { $0 == locatedDonation }!
        }
        
        
        let donationListViewModel = DonationListViewModel(
            donations: _donations,
            externalSelection: selectedIndex) { [unowned self] donation in
                guard !self.isAlreadySelected(donation) else {
                    print("Donation already selected")
                    return
                }

                self._selectedDonation.value = self._locatedDonations.value.first(where: { $0.0 == donation })!
        }

        return donationListViewModel
    }
    
    open func fetchDonations() -> SignalProducer<(), NoError> {
        return _donationRepository
            .fetchDonationsWithLocation()
            .on(value: {
                self._locatedDonations.value = $0
                self._selectedDonation.value = $0.first
            })
            .map { _ in () }
    }
    
    open func createConfirmDonationViewModel() -> ConfirmDonationViewModel {
        return ConfirmDonationViewModel()
    }
}

private extension DonationPickerViewModel {

    func isAlreadySelected(_ donation: Donation) -> Bool {
        return _selectedDonation.value?.0 == donation
    }

    func isAlreadySelected(_ annotation: MapViewAnnotation) -> Bool {
        return _selectedDonation.value?.1 == annotation
    }
}
