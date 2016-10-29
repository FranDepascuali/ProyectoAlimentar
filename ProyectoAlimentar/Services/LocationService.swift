//
//  LocationService.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/17/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation

import CoreLocation
import ReactiveCocoa
import Result

public protocol LocationServiceType {

    var locations: Signal<CLLocation, NoError> { get }

    func startUpdatingLocation(accuracy: CLLocationAccuracy) -> Bool

    func stopUpdatingLocation()

}

public final class LocationService: NSObject, LocationServiceType {

    private var _locationManager = CLLocationManager()

    private let (_locations, _locationsSink) = Signal<CLLocation, NoError>.pipe()
    public var locations: Signal<CLLocation, NoError> {
        return _locations
    }

    public override init() {
        super.init()
        if locationServicesEnabled() {
            _locationManager.requestAlwaysAuthorization()
            _locationManager.delegate = self
        }
    }

    public func startUpdatingLocation(accuracy: CLLocationAccuracy = kCLLocationAccuracyBestForNavigation) -> Bool {
        if locationServicesEnabled() {
            _locationManager.desiredAccuracy = accuracy
            _locationManager.startUpdatingLocation()
            return true
        }
        return false
    }

    public func stopUpdatingLocation() {
        if locationServicesEnabled() {
            _locationManager.stopUpdatingLocation()
        }
    }

    public func locationServicesEnabled() -> Bool {
        return CLLocationManager.locationServicesEnabled()
    }


}

extension LocationService: CLLocationManagerDelegate {

    public func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for location in locations {
            self._locationsSink.sendNext(location)
        }
    }

}
