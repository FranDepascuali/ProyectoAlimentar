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
        return [getDonationPickerViewController(), getActiveDonationsViewController()]
    }

    private func getActiveDonationsViewController() -> ActiveDonationsViewController {
        let annotations = [BuenosAires, BuenosAires2, BuenosAires3, BuenosAires4, BuenosAires5, BuenosAires, BuenosAires2, BuenosAires3, BuenosAires4, BuenosAires5]

        let fakedDonations = annotations.enumerate().map { Selection(donation: Donation(id: $0), annotation: $1 )}

        let viewModel = ActiveDonationsViewModel(donations: fakedDonations.map { $0._donation })
        return ActiveDonationsViewController(viewModel: viewModel)
    }

    private func getDonationPickerViewController() -> DonationPickerViewController {
        let annotations = [BuenosAires, BuenosAires2, BuenosAires3, BuenosAires4, BuenosAires5]

        let fakedDonations = annotations.enumerate().map { Selection(donation: Donation(id: $0), annotation: $1 )}

        let viewModel = DonationPickerViewModel(selections: fakedDonations)

        return DonationPickerViewController(viewModel: viewModel)
    }

}
