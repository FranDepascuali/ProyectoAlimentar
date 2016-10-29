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

public struct Selection {

    // TODO: This should be private and a mutable property
    public let _donation: Donation

    private let _annotation: MapViewAnnotation

    public init(donation: Donation, annotation: MapViewAnnotation) {
        _donation = donation
        _annotation = annotation
    }

}

public class DonationPickerViewModel {

    private let _selected: MutableProperty<Selection?> = MutableProperty(.None)

    private let _selections: [Selection]

    public init(selections: [Selection]) {
        _selections = selections
    }

    public func mapViewModel() -> MapViewModel {

        let selectedForMap = _selected
                .signal
                .ignoreNil()
                .map { $0._annotation }

        let mapViewModel = MapViewModel(
            annotations: _selections.map { $0._annotation },
            externalSelection: selectedForMap) { [unowned self] annotation in
                guard !self.isAlreadySelected(annotation) else {
                    print("Annotation already selected")
                    return
                }

                self._selected.value = self._selections.filterFirst { $0._annotation == annotation }!
        }

        return mapViewModel

    }

    public func donationListViewModel() -> DonationListViewModel {
        let selectedForList = _selected
            .signal
            .ignoreNil()
            .map { $0._donation }

        let donationListViewModel = DonationListViewModel(
            donations: _selections.map { $0._donation },
            externalSelection: selectedForList) { [unowned self] donation in
                guard !self.isAlreadySelected(donation) else {
                    print("Donation already selected")
                    return
                }

                self._selected.value = self._selections.filterFirst { $0._donation == donation }!
        }

        return donationListViewModel
    }
}

private extension DonationPickerViewModel {

    private func isAlreadySelected(donation: Donation) -> Bool {
        return _selected.value?._donation == donation
    }

    private func isAlreadySelected(annotation: MapViewAnnotation) -> Bool {
        return _selected.value?._annotation == annotation
    }
}
