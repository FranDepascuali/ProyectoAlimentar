//
//  MapViewAnnotation.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/18/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

public final class MapViewAnnotation: NSObject, MKAnnotation {

    public var coordinate: CLLocationCoordinate2D

    public init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        super.init()
    }
}

public extension MapViewAnnotation {

    public static var orderAnnotationIdentifier: String {
        return "orderAnnotation"
    }

}
