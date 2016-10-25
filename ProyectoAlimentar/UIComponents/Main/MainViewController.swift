//
//  MainViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/20/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation

import UIKit

public final class MainViewController: UIViewController {
    
    private let _viewModel: MainViewModel
    private lazy var _viewControllers: [UIViewController] = self.initializeControllers()
    
    private lazy var _mainView: MainView = MainView.loadFromNib()!
    
    public init(viewModel: MainViewModel) {
        _viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        view = _mainView
        
        loadViewController(_viewControllers[0], into: _mainView.containerView)
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
    }

}

private extension MainViewController {
    
    private func bindViewModel() {
        
    }
    
    private func initializeControllers() -> [UIViewController] {
        return [getDonationPickerViewController()]
    }
    
    private func getDonationPickerViewController() -> DonationPickerViewController {
        let annotations = [BuenosAires, BuenosAires2, BuenosAires3, BuenosAires4, BuenosAires5]
        
        let fakedDonations = annotations.enumerate().map { Selection(donation: Donation(id: $0), annotation: $1 )}
        
        let viewModel = DonationPickerViewModel(selections: fakedDonations)
        
        return DonationPickerViewController(viewModel: viewModel)
    }
    
}
