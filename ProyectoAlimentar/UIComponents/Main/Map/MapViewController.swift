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
    
    private var _initiallyLoaded: Bool = false
    
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
    
    override public func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !_initiallyLoaded {
            addAnnotationsToMap(_viewModel.annotations)
            _initiallyLoaded = true
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
        _viewModel.selected
            .map { Optional.Some($0) }
            .combinePrevious(.None)
            .observeNext { [unowned self] in
                self.centerMap($0.1!)
                self._mapView.map.viewForAnnotation($0.1!)?.image = UIImage(identifier: ImageAssetIdentifier.SelectedOrderPin)
                
                let previousAnnotation = $0.0.flatMap { self._mapView.map.viewForAnnotation($0) }
                
                guard let _previousAnnotation = previousAnnotation else {
                    return
                }
                
                _previousAnnotation.image = UIImage(identifier: ImageAssetIdentifier.OrderPin)
        }
    }
    
    private func initializeMap() {
        _mapView.map.delegate = self
        _mapView.map.scrollEnabled = true
        _mapView.map.zoomEnabled = true
        _mapView.map.showsPointsOfInterest = false
    }
    
    /* Add the annotations to reload annotation's imagesViews */
    private func addAnnotationsToMap(annotations: [MapViewAnnotation]) {
        _mapView.map.addAnnotations(annotations)
        _mapView.map.showAnnotations(annotations, animated: false)
    }
    
    private func centerMap(annotation: MapViewAnnotation) {
        let coordinate = annotation.coordinate
//        let span = MKCoordinateSpan(
//            latitudeDelta: 0.01,
//            longitudeDelta: 0.01)
        
        
//        let _region = MKCoordinateRegionMakeWithDistance(coordinate, 500, 500)
//        let region = MKCoordinateRegion(center: coordinate, span: span)
        
//        _mapView.map.region = _region
        UIView.animateWithDuration(0.5) {
            self._mapView.map.centerCoordinate = coordinate
        }
//        coordinate.latitude -= _mapView.map.region.span.latitudeDelta * 0.3
//        _mapView.map.setCenterCoordinate(coordinate, animated: true)
    }
    
}