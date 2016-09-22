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
    
    private var _annotations: [MapViewAnnotation?]
    
    private let _selected = MutableProperty<MapViewAnnotation?>(nil)
    public var selected: AnyProperty<MapViewAnnotation?>
    
    private let _notifySelection: Int -> ()
    
    public init(annotations: [MapViewAnnotation?], externalSelection: Signal<Int, NoError>, notifySelection: Int -> ()) {
        _annotations = annotations
        _notifySelection = notifySelection
        selected = AnyProperty(_selected)
        
        _selected <~ externalSelection
            .observeOn(UIScheduler())
            .map { [unowned self] selection in self._annotations[selection] }
    }
    
    public func tapped(annotation: MapViewAnnotation) {
        let position = Int (_annotations.indexOf { $0 == annotation }!)
        _selected.value = _annotations[position]
        _notifySelection(position)
    }
    
    public func getAnnotations() -> [MapViewAnnotation] {
        return _annotations.flatMap { $0 }
    }
}
