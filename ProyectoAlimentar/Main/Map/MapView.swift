//
//  MapView.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import MapKit
import Core

public final class MapView: UIView, NibLoadable {
    
    @IBOutlet weak var map: MKMapView! {
        didSet {
            map.zoomEnabled = true
            map.scrollEnabled = true
//            mapView.region.span.longitudeDelta  *= 0.05;
//            mapView.region.span.latitudeDelta  *= 0.05;
        }
    }
    
}