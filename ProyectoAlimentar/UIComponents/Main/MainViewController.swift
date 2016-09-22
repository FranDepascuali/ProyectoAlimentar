//
//  MainViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import Core
import ReactiveCocoa

public final class MainViewController: UIViewController {
    
    private let _mainView = MainView.loadFromNib()!
    
    private let _viewModel: MainViewModel
    
    private var loaded = false
    
    private let _mapViewController: MapViewController
    
    private let _donationListViewController: DonationListViewController
    
    init(viewModel: MainViewModel) {
        _viewModel = viewModel
        _mapViewController = MapViewController(viewModel: _viewModel.mapViewModel())
        _donationListViewController = DonationListViewController(viewModel: _viewModel.donationListViewModel())
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = _mainView
        
        loadViewController(_mapViewController, into: _mainView.mapContainerView)
        loadViewController(_donationListViewController, into: _mainView.donationDetailContainerView)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        _mainView.communityKitchenButton.setAction { [unowned self] _ in
            self._mainView.selectedMapType = .CommunityKitchen
        }
        
        _mainView.donorsButton.setAction { [unowned self] _ in
            self._mainView.selectedMapType = .Donor
        }
        
        _mainView.selectedMapType = .Donor
    }
    
}
