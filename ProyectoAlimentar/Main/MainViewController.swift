//
//  MainViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import Core

public final class MainViewController: UIViewController {
    
    private let _mainView = MainView.loadFromNib()!
    
    private let _viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        _viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = _mainView
        
        loadViewController(MapViewController(), into: _mainView.mapContainerView)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        _mainView.communityKitchenButton.setAction { [unowned self] _ in
            self._mainView.selectedMapType = .CommunityKitchen
        }
        
        _mainView.donorsButton.setAction { [unowned self] _ in
            self._mainView.selectedMapType = .Donor
        }
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let carousel = CarouselController(collectionViewLayout: createFlowLayout())
        carousel.delegate = self
        
        loadViewController(carousel, into: _mainView.donationDetailContainerView)
        
        _mainView.selectedMapType = .Donor
    }
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: _mainView.donationDetailContainerView.frame.width,
                                 height: _mainView.donationDetailContainerView.frame.height)
        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = SessionTrickListController.MinimumLineSpacing
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        return layout
    }
}

//TODO: this should not be the delegate
extension MainViewController: CarouselControllerDelegate {
    
    public func carousel(carousel: CarouselController, didSelectItemAtIndex index: Int) {
        
    }
    
    public func carousel(carousel: CarouselController, cellForRowAtCarouselIndex index: Int) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    public func numberOfItems(carousel: CarouselController) -> Int {
        return 5
    }
}
