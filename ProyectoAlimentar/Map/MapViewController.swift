//
//  MapViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import Core

public final class MapViewController: UIViewController {
    
    private let _mapView: MapView = MapView.loadFromNib()!
    
    public override func loadView() {
        view = _mapView
    }
}