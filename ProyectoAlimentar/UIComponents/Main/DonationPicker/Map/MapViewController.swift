//
//  MapViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import MapKit
import ReactiveSwift

public final class MapViewController: UIViewController {

    fileprivate let _mapView: MapView = MapView.loadFromNib()!

    fileprivate let _viewModel: MapViewModel

    fileprivate var _initiallyLoaded: Bool = false

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
//        bindViewModel()
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !_initiallyLoaded {
            _initiallyLoaded = true
            bindViewModel()
        }
    }

}

extension MapViewController: MKMapViewDelegate {

    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }

        let reuseId = MapViewAnnotation.orderAnnotationIdentifier
        if let view = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) {
            view.annotation = annotation
            return view
        } else {
            let view = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            view.image = UIImage(identifier: ImageAssetIdentifier.OrderPin)
            return view
        }

    }

    public func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        _viewModel.tapped(view.annotation as! MapViewAnnotation)
    }

}

private extension MapViewController {

    func bindViewModel() {
        
        _viewModel.annotations
            .producer
            .observe(on: UIScheduler())
            .startWithValues { [unowned self] in
                self.addAnnotationsToMap($0)
        }
        
        _viewModel.selected
            .map { Optional.some($0) }
            .combinePrevious(.none)
            .observeValues { [unowned self] in
                self.centerMap($0.1!)
                self._mapView.map.view(for: $0.1!)?.image = UIImage(identifier: ImageAssetIdentifier.SelectedOrderPin)

                let previousAnnotation = $0.0.flatMap { self._mapView.map.view(for: $0) }

                guard let _previousAnnotation = previousAnnotation else {
                    return
                }

                _previousAnnotation.image = UIImage(identifier: ImageAssetIdentifier.OrderPin)
        }
    }

    func initializeMap() {
        _mapView.map.delegate = self
        _mapView.map.isScrollEnabled = true
        _mapView.map.isZoomEnabled = true
        _mapView.map.showsPointsOfInterest = false
    }

    /* Add the annotations to reload annotation's imagesViews */
    func addAnnotationsToMap(_ annotations: [MapViewAnnotation]) {
        _mapView.map.addAnnotations(annotations)
        _mapView.map.showAnnotations(annotations, animated: false)
    }

    func centerMap(_ annotation: MapViewAnnotation) {
        let coordinate = annotation.coordinate
        UIView.animate(withDuration: 0.5, animations: {
            self._mapView.map.centerCoordinate = coordinate
        }) 
    }

}
