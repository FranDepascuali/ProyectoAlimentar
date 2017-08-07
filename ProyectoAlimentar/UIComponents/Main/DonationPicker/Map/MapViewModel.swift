//
//  MapViewModel.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import CoreLocation
import ReactiveSwift
import enum Result.NoError

import Foundation
import ReactiveSwift
import Result

public final class MapViewModel {

    public let annotations: Property<[MapViewAnnotation]>

    fileprivate let _notifySelection: (MapViewAnnotation) -> ()

    public let selected: Signal<MapViewAnnotation, NoError>

    public init(annotations: Property<[MapViewAnnotation]>,
                externalSelection: Signal<MapViewAnnotation, NoError>,
                notifySelection: @escaping (MapViewAnnotation) -> ()) {

        self.annotations = annotations
        _notifySelection = notifySelection
        selected = externalSelection.observe(on: UIScheduler())
    }

    public func tapped(_ annotation: MapViewAnnotation) {
        _notifySelection(annotation)
    }

}
