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
        _window.rootViewController = getRootViewController()
        _window.makeKeyAndVisible()

        _userRepository.currentUser
            .signal
            .ignoreNil()
            .observeOn(UIScheduler())
            .observeNext { [unowned self] _ in
                self._window.rootViewController = self.createMainViewController()
        }
    }

}

private extension MainCoordinator {

    private func createMainViewController() -> MainViewController {
        return MainViewController(viewModel: MainViewModel())
    }

    private func createLoginViewController() -> LoginViewController {
        return LoginViewController(viewModel: LoginViewModel())
    }

    private func getRootViewController() -> UIViewController {
        return createMainViewController()
//        if let _ = _userRepository.currentUser.value {
//            return createMainViewController()
//        } else {
//            return createLoginViewController()
//        }
    }

}
