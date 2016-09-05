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
    }
    
    public override func viewDidLoad() {
        loadViewController(MapViewController(), into: _mainView.mapContainerView)
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        _mainView.selectedMapType = .Donor
    }
}