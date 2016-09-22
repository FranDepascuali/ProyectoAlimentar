//
//  MainViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import ReactiveCocoa

public struct MainViewModel {
    
    public func mapViewModel() -> MapViewModel {
        return MapViewModel(
            annotations: [MapViewAnnotation(coordinate: CLLocationCoordinate2D(latitude: -34.603105, longitude: -58.367894))], externalSelection: Signal.empty, notifySelection: { _ in () })
    }
    
    public func donationListViewModel() -> DonationListViewModel {
        return DonationListViewModel()
    }
}
