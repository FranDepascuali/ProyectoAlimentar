//
//  MainViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/20/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import ReactiveSwift

public final class MainViewController: UIViewController {

    fileprivate let _viewModel: MainViewModel
    fileprivate lazy var _viewControllers: [UIViewController] = self.initializeControllers()

    fileprivate lazy var _mainView: MainView = MainView.loadFromNib()!

    public init(viewModel: MainViewModel) {
        _viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func loadView() {
        view = _mainView

        load(childViewController: _viewControllers[0], into: _mainView.containerView)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        _mainView.tabBar.delegate = self
        bindViewModel()
    }

}

extension MainViewController: UITabBarDelegate {

    public func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if let index = _mainView.tabBar.indexForItem(item) {
            _viewModel.selectTab(at: index)
        }
    }

}

private extension MainViewController {

    func displayControllerAt(_ index: Int) {
        _mainView.containerView.subviews.forEach { $0.removeFromSuperview() }
        _mainView.tabBar.selectItemAt(index)
        load(childViewController: _viewControllers[index], into: _mainView.containerView)
    }

    func bindViewModel() {
        _viewModel.selectedTab
            .producer
            .observe(on: UIScheduler())
            .startWithValues { [unowned self] item in
                self.displayControllerAt(item.rawValue)
        }
    }

    func initializeControllers() -> [UIViewController] {
        return [getDonationPickerViewController(), getActiveDonationsViewController(),
            getDonationsRecordViewController(), getProfileViewController()]
    }

    func getActiveDonationsViewController() -> ActiveDonationsViewController {
        return ActiveDonationsViewController(viewModel: _viewModel.createActiveDonationsViewModel())
    }

    func getDonationPickerViewController() -> DonationPickerViewController {
        return DonationPickerViewController(viewModel: _viewModel.createDonationPickerViewModel())
    }

    func getDonationsRecordViewController() -> DonationsRecordViewController {
        return DonationsRecordViewController(viewModel: _viewModel.createDonationsRecordViewModel())
    }
    
    func getProfileViewController() -> LoginViewController {
        return LoginViewController(viewModel: _viewModel.createProfileViewModel())
    }
}
