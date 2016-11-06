//
//  MapViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import CoreLocation
import ReactiveCocoa
import enum Result.NoError

import Foundation
import ReactiveCocoa
import Result

public final class MapViewModel {

    public let annotations: AnyProperty<[MapViewAnnotation]>

    private let _notifySelection: MapViewAnnotation -> ()

    public let selected: Signal<MapViewAnnotation, NoError>

    public init(annotations: AnyProperty<[MapViewAnnotation]>,
                externalSelection: Signal<MapViewAnnotation, NoError>,
                notifySelection: MapViewAnnotation -> ()) {

        self.annotations = annotations
        _notifySelection = notifySelection
        selected = externalSelection.observeOn(UIScheduler())
    }

    public func tapped(annotation: MapViewAnnotation) {
        _notifySelection(annotation)
    }

}
