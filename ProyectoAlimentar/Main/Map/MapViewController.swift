//
//  MapViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import MapKit

public final class MapViewController: UIViewController {
    
    private let _mapView = MapView.loadFromNib()!
    
    private let _viewModel: MapViewModel
    
    public init(viewModel: MapViewModel) {
        _viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // We need to add this initializer because by adding init(viewModel), it is required.
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        self.view = _mapView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        initializeMap()
        bindViewModel()
    }
    
    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if let firstTrickAnnotation = _viewModel.getAnnotations().get(0) {
            centerMap(firstTrickAnnotation)
        }
    }
    
}

extension MapViewController: MKMapViewDelegate {
    
    public func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation {
//            return nil
//        }
//        
//        let reuseId = MapViewAnnotation.trickAnnotationIdentifier
//        if let view = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) {
//            view.annotation = annotation
//            return view
//        } else {
//            let view = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//            view.image = UIImage(identifier: .MarkerInactive)
//            return view
//        }
        return nil
    }
    
    public func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView) {
        _viewModel.tapped(view.annotation as! MapViewAnnotation)
    }
    
}

private extension MapViewController {
    
    private func bindViewModel() {
        addAnnotationsToMap(_viewModel.getAnnotations())
        _viewModel.selected.producer
            .ignoreNil()
            .startWithNext { [unowned self] in self.centerMap($0) }
    }
    
    private func initializeMap() {
        _mapView.map.delegate = self
        _mapView.map.scrollEnabled = true
        _mapView.map.zoomEnabled = true
    }
    
    /* Add the annotations to reload annotation's imagesViews */
    private func addAnnotationsToMap(trickList: [MapViewAnnotation]) {
        _mapView.map.addAnnotations(trickList)
        _mapView.map.showAnnotations(trickList, animated: false)
    }
    
    // We center the map on the annotation plus an offset to show it above of the trick list
    private func centerMap(annotation: MapViewAnnotation) {
        var coordinate = annotation.coordinate
        coordinate.latitude -= _mapView.map.region.span.latitudeDelta * 0.3
        _mapView.map.setCenterCoordinate(coordinate, animated: true)
    }
    
}