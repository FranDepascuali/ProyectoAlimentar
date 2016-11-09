//
//  ConfirmDonationViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/8/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public final class ConfirmDonationViewController: UIViewController {
    
    private let _confirmDonationView = ConfirmDonationView.loadFromNib()!
    
    private let _viewModel: ConfirmDonationViewModel
    
    private let _onAccept: () -> ()
    
    private let _onCancel: () -> ()
    
    public init(viewModel: ConfirmDonationViewModel,
                onAccept: () -> (),
                onCancel: () -> ()) {
        _viewModel = viewModel
        _onAccept = onAccept
        _onCancel = onCancel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        view = _confirmDonationView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel(_viewModel)
    }
}

private extension ConfirmDonationViewController {
    
    private func bindViewModel(viewModel: ConfirmDonationViewModel) {
        _confirmDonationView.acceptButton.setAction { [unowned self] _ in
            self._onAccept()
        }
        
        _confirmDonationView.cancelButton.setAction { [unowned self] _ in
            self._onAccept()
        }
    }
}
