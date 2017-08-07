//
//  DonationDetailViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/10/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public final class ActiveDonationDetailViewController: UIViewController {
    
    fileprivate let _viewModel: ActiveDonationDetailViewModel
    
    fileprivate lazy var _donationDetailView: ActiveDonationDetailView = ActiveDonationDetailView.loadFromNib()!
    
    public init(viewModel: ActiveDonationDetailViewModel) {
        _viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        view = _donationDetailView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel(_viewModel)
    }

}

private extension ActiveDonationDetailViewController {
    
    func bindViewModel(_ viewModel: ActiveDonationDetailViewModel) {
        _donationDetailView.donationDetailsView.bindViewModel(viewModel.donationDetailsViewModel)
    }
    
}
