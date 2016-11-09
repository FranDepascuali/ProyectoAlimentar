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

public final class DonationPickerViewController: UIViewController {

    private let _mainView = DonationPickerView.loadFromNib()!

    private let _viewModel: DonationPickerViewModel

    private let _mapViewController: MapViewController

    private lazy var _donationListViewController: DonationListViewController = {
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
        
        bindViewModel(_viewModel)
    }
    
}

private extension DonationPickerViewController {
    
    private func bindViewModel(viewModel: DonationPickerViewModel) {
        viewModel
            .fetchDonations()
            .start()
    }
    
    private func presentConfirmDonationController(donation: Donation) {
        let confirmDonationController = ConfirmDonationViewController(
            viewModel: self._viewModel.createConfirmDonationViewModel(),
            onAccept: { [unowned self] _ in self.donationCancelled() },
            onCancel: { [unowned self] _ in self.donationAccepted() })
        
        _mainView.addBlackOverlay()
        loadViewController(confirmDonationController, into: _mainView.confirmDonationContainerView)
        _mainView.confirmDonationContainerView.hidden = false
    }
    
    private func donationCancelled() {
        _mainView.confirmDonationContainerView.hidden = true
        _mainView.removeBlackOverlay()
    }
    
    private func donationAccepted() {
        _mainView.confirmDonationContainerView.hidden = true
       _mainView.removeBlackOverlay() 
    }
}
