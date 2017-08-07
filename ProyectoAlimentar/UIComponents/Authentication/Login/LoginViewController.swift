//
//  LoginViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/20/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
//import FacebookLogin
//import FacebookCore
import Core

public final class LoginViewController: UIViewController {

    fileprivate let _viewModel: LoginViewModel
//
//    fileprivate lazy var _loginView: LoginView = LoginView.loadFromNib()!
//
    public init(viewModel: LoginViewModel) {
        _viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    override public func loadView() {
//        view = _loginView
//        
//        loadFacebookButton()
//    }
//
//    override public func viewDidLoad() {
//        super.viewDidLoad()
//
//        bindViewModel()
//    }

}
//
//private extension LoginViewController {
//
//    func bindViewModel() {
//
//    }
//
//    func loadFacebookButton() {
//        let loginButton = LoginButton(readPermissions: [.publicProfile, .userFriends, .email])
//        loginButton.add(into:_loginView.facebookButtonContainerView)
//        loginButton.delegate = self
//    }
//}
//
//extension LoginViewController: LoginButtonDelegate {
//    
//    public func loginButtonDidCompleteLogin(_ loginButton: LoginButton, result: LoginResult) {
//        
//        switch result {
//        case .cancelled:
//            print("Login cancelled")
//        case .failed(let error):
//            print("Login failed with error \(error)")
//        case .success(_, _, let token):
//            _viewModel
//                .login(token.authenticationToken)
//                .start()
//        }
//    }
//    
//    public func loginButtonDidLogOut(_ loginButton: LoginButton) {
//        // Do nothing
//    }
//}
