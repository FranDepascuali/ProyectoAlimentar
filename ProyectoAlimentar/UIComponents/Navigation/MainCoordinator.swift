//
//  MainCoordinator.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/28/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import ReactiveCocoa

public final class MainCoordinator {

    private let _window: UIWindow
    private let _userRepository: UserRepositoryType

    public init(window: UIWindow, userRepository: UserRepositoryType) {
        _window = window
        _userRepository = userRepository
    }

    public func start() {
        _window.makeKeyAndVisible()
        
        _userRepository.currentUser
            .producer
            .observeOn(UIScheduler())
            .startWithNext { [unowned self] in
                self._window.rootViewController = self.getRootViewController($0)
        }
    }
}

private extension MainCoordinator {

    private func createMainViewController() -> MainViewController {
        return MainViewController(viewModel: MainViewModel(donationsRepository: FakedDonationsRepository(), userRepository: _userRepository))
    }

    private func createLoginViewController() -> LoginViewController {
        return LoginViewController(viewModel: LoginViewModel(userRepository: _userRepository))
    }

    private func getRootViewController(user: User?) -> UIViewController {
        if let _ = user {
            return createMainViewController()
        } else {
            return createMainViewController()
        }
    }

}
