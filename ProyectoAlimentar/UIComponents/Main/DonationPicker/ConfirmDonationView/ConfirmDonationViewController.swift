//
//  ConfirmDonationViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/8/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public final class ConfirmDonationViewController: UIViewController {
    
    fileprivate let _confirmDonationView: ConfirmDonationView = ConfirmDonationView.loadFromNib()!
    
    fileprivate let _viewModel: ConfirmDonationViewModel
    
    fileprivate let _onAccept: () -> ()
    
    fileprivate let _onCancel: () -> ()
    
    public init(viewModel: ConfirmDonationViewModel,
                onAccept: @escaping () -> (),
                onCancel: @escaping () -> ()) {
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
    
    func bindViewModel(_ viewModel: ConfirmDonationViewModel) {
        _confirmDonationView.acceptButton.setAction { [unowned self] _ in
            self._onAccept()
        }
        
        _confirmDonationView.cancelButton.setAction { [unowned self] _ in
            self._onAccept()
        }
    }
}
