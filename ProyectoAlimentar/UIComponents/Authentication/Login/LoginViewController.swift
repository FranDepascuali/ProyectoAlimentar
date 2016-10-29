//
//  LoginViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/20/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

import UIKit

public final class LoginViewController: UIViewController {

    private let _viewModel: LoginViewModel

    private lazy var _loginView: LoginView = LoginView.loadFromNib()!

    public init(viewModel: LoginViewModel) {
        _viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func loadView() {
        view = _loginView
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
    }

}

private extension LoginViewController {

    private func bindViewModel() {

    }

}
