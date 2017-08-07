//
//  MainCoordinator.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/28/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import ReactiveSwift

public final class MainCoordinator {

    fileprivate let _window: UIWindow
    fileprivate let _userRepository: UserRepositoryType

    public init(window: UIWindow, userRepository: UserRepositoryType) {
        _window = window
        _userRepository = userRepository
    }

    public func start() {
        _window.makeKeyAndVisible()
        
        _userRepository.currentUser
            .producer
            .observe(on: UIScheduler())
            .startWithValues { [unowned self] in
                self._window.rootViewController = self.getRootViewController($0)
        }
    }
}

private extension MainCoordinator {

    func createMainViewController() -> MainViewController {
        return MainViewController(viewModel: MainViewModel(donationsRepository: FakedDonationsRepository(), userRepository: _userRepository))
    }

    func createLoginViewController() -> LoginViewController {
        return LoginViewController(viewModel: LoginViewModel(userRepository: _userRepository))
    }

    func getRootViewController(_ user: User?) -> UIViewController {
        if let _ = user {
            return createMainViewController()
        } else {
            return createMainViewController()
        }
    }

}
