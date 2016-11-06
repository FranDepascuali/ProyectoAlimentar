//
//  MainViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/20/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import ReactiveCocoa

public final class MainViewController: UIViewController {

    private let _viewModel: MainViewModel
    private lazy var _viewControllers: [UIViewController] = self.initializeControllers()

    private lazy var _mainView = MainView.loadFromNib()!

    public init(viewModel: MainViewModel) {
        _viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func loadView() {
        view = _mainView

        loadViewController(_viewControllers[0], into: _mainView.containerView)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        _mainView.tabBar.delegate = self
        bindViewModel()
    }

}

extension MainViewController: UITabBarDelegate {

    public func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        if let index = _mainView.tabBar.indexForItem(item) {
            _viewModel.selectTab(at: index)
        }
    }

}

private extension MainViewController {

    private func displayControllerAt(index: Int) {
        _mainView.containerView.subviews.forEach { $0.removeFromSuperview() }
        _mainView.tabBar.selectItemAt(index)
        loadViewController(_viewControllers[index], into: _mainView.containerView)
    }

    private func bindViewModel() {
        _viewModel.selectedTab
            .producer
            .observeOn(UIScheduler())
            .startWithNext { [unowned self] item in
                self.displayControllerAt(item.rawValue)
        }
    }

    private func initializeControllers() -> [UIViewController] {
        return [getDonationPickerViewController(), getActiveDonationsViewController(),
            getDonationsRecordViewController()]
    }

    private func getActiveDonationsViewController() -> ActiveDonationsViewController {
        return ActiveDonationsViewController(viewModel: _viewModel.createActiveDonationsViewModel())
    }

    private func getDonationPickerViewController() -> DonationPickerViewController {
        return DonationPickerViewController(viewModel: _viewModel.createDonationPickerViewModel())
    }

    private func getDonationsRecordViewController() -> DonationsRecordViewController {
        return DonationsRecordViewController(viewModel: _viewModel.createDonationsRecordViewModel())
    }
}
