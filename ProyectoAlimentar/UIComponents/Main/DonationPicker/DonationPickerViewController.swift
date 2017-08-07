//
//  MainViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import Core
import ReactiveSwift

public final class DonationPickerViewController: UIViewController {

    fileprivate let _mainView: DonationPickerView = DonationPickerView.loadFromNib()!

    fileprivate let _viewModel: DonationPickerViewModel

    fileprivate let _mapViewController: MapViewController

    fileprivate lazy var _donationListViewController: DonationListViewController = {
        return DonationListViewController(viewModel: self._viewModel.donationListViewModel(), onConfirmDonation: self.presentConfirmDonationController)
    }()

    init(viewModel: DonationPickerViewModel) {
        _viewModel = viewModel
        _mapViewController = MapViewController(viewModel: _viewModel.mapViewModel())

        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        view = _mainView
        
        load(childViewController: _mapViewController, into: _mainView.mapContainerView)
        load(childViewController: _donationListViewController, into: _mainView.donationDetailContainerView)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        _mainView.communityKitchenButton.setAction { [unowned self] _ in
            self._mainView.selectedMapType = .communityKitchen
        }

        _mainView.donorsButton.setAction { [unowned self] _ in
            self._mainView.selectedMapType = .donor
        }

        _mainView.selectedMapType = .donor
        
        bindViewModel(_viewModel)
    }
    
}

private extension DonationPickerViewController {
    
    func bindViewModel(_ viewModel: DonationPickerViewModel) {
        viewModel
            .fetchDonations()
            .start()
    }
    
    func presentConfirmDonationController(_ donation: Donation) {
        let confirmDonationController = ConfirmDonationViewController(
            viewModel: self._viewModel.createConfirmDonationViewModel(),
            onAccept: { [unowned self] _ in self.donationCancelled() },
            onCancel: { [unowned self] _ in self.donationAccepted() })
        
        _mainView.addBlackOverlay()
        load(childViewController: confirmDonationController, into: _mainView.confirmDonationContainerView)
        _mainView.confirmDonationContainerView.isHidden = false
    }
    
    func donationCancelled() {
        _mainView.confirmDonationContainerView.isHidden = true
        _mainView.removeBlackOverlay()
    }
    
    func donationAccepted() {
        _mainView.confirmDonationContainerView.isHidden = true
       _mainView.removeBlackOverlay() 
    }
}
