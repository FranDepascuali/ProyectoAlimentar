//
//  MainViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import ReactiveCocoa
import Core
import Result

public typealias LocatedDonation = (Donation, MapViewAnnotation)

public class DonationPickerViewModel {

    private let _selectedDonation: MutableProperty<LocatedDonation?> = MutableProperty(.None)
    
    private let _locatedDonations: MutableProperty<[LocatedDonation]>
    
    private var _donations: AnyProperty<[Donation]> {
        let extractDonations: [LocatedDonation] -> [Donation] =
            { $0.map { $0.0 } }
        
        return AnyProperty(_locatedDonations).map(extractDonations)
    }
    
    private var _annotations: AnyProperty<[MapViewAnnotation]> {
        
        let extractAnnotations: [LocatedDonation] -> [MapViewAnnotation] =
            { $0.map { $0.1 } }
        
        return AnyProperty(_locatedDonations).map(extractAnnotations)
    }
    
    private let _donationRepository: DonationRepositoryType

    public init(donationRepository: DonationRepositoryType) {
        _locatedDonations = MutableProperty([])
        _donationRepository = donationRepository
    }

    public func mapViewModel() -> MapViewModel {
        let selectedForMap = _selectedDonation
                .signal
                .ignoreNil()
                .map { $0.1 }

        let mapViewModel = MapViewModel(
            annotations: _annotations,
            externalSelection: selectedForMap) { [unowned self] annotation in
                guard !self.isAlreadySelected(annotation) else {
                    print("Annotation already selected")
                    return
                }

                self._selectedDonation.value = self._locatedDonations.value.filterFirst { $0.1 == annotation }!
        }

        return mapViewModel

    }

    public func donationListViewModel() -> DonationListViewModel {
        
        let selectedIndex = _selectedDonation
            .signal
            .ignoreNil()
            .map { [unowned self] locatedDonation in
                self._locatedDonations.value.indexOf { $0 == locatedDonation }!
        }
        
        
        let donationListViewModel = DonationListViewModel(
            donations: _donations,
            externalSelection: selectedIndex) { [unowned self] donation in
                guard !self.isAlreadySelected(donation) else {
                    print("Donation already selected")
                    return
                }

                self._selectedDonation.value = self._locatedDonations.value.filterFirst { $0.0 == donation }!
        }

        return donationListViewModel
    }
    
    public func fetchDonations() -> SignalProducer<(), NoError> {
        return _donationRepository
            .fetchDonationsWithLocation()
            .on(next: {
                self._locatedDonations.value = $0
                self._selectedDonation.value = $0.first
            })
            .map { _ in () }
    }
}

private extension DonationPickerViewModel {

    private func isAlreadySelected(donation: Donation) -> Bool {
        return _selectedDonation.value?.0 == donation
    }

    private func isAlreadySelected(annotation: MapViewAnnotation) -> Bool {
        return _selectedDonation.value?.1 == annotation
    }
}
