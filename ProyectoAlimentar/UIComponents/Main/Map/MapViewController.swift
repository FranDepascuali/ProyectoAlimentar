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
        initializeMap()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        view = _mapView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
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
        if annotation is MKUserLocation {
            return nil
        }
        
        let reuseId = MapViewAnnotation.orderAnnotationIdentifier
        if let view = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) {
            view.annotation = annotation
            return view
        } else {
            let view = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            view.image = UIImage(identifier: ImageAssetIdentifier.OrderPin)
            return view
        }

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
            .take(1) // TODO: remove this
            .startWithNext { [unowned self] in self.centerMap($0) }
    }
    
    private func initializeMap() {
        _mapView.map.delegate = self
        _mapView.map.scrollEnabled = true
        _mapView.map.zoomEnabled = true
        _mapView.map.showsPointsOfInterest = false
    }
    
    /* Add the annotations to reload annotation's imagesViews */
    private func addAnnotationsToMap(trickList: [MapViewAnnotation]) {
        _mapView.map.addAnnotations(trickList)
//        _mapView.map.showAnnotations(trickList, animated: false)
    }
    
    private func centerMap(annotation: MapViewAnnotation) {
        let coordinate = annotation.coordinate
//        let span = MKCoordinateSpan(
//            latitudeDelta: 0.01,
//            longitudeDelta: 0.01)
        
        
        let _region = MKCoordinateRegionMakeWithDistance(coordinate, 500, 500)
//        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        _mapView.map.region = _region
//        coordinate.latitude -= _mapView.map.region.span.latitudeDelta * 0.3
//        _mapView.map.setCenterCoordinate(coordinate, animated: true)
    }
    
}