//
//  ActiveDonationsViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/24/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public final class ActiveDonationsViewController: UIViewController {

    fileprivate let _viewModel: ActiveDonationsViewModel

    fileprivate lazy var _activeDonationsView: ActiveDonationsView = ActiveDonationsView.loadFromNib()!

    public init(viewModel: ActiveDonationsViewModel) {
        _viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func loadView() {
        view = _activeDonationsView
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        _activeDonationsView.activeDonationsCollectionView.collectionViewLayout.invalidateLayout()
        _activeDonationsView.activeDonationsCollectionView.collectionViewLayout = createFlowLayout()
        _activeDonationsView.activeDonationsCollectionView.reloadData()
        _activeDonationsView.activeDonationsCollectionView.setContentOffset(CGPoint.zero, animated: false)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        initializeCollectionView()
        bindViewModel()
    }

}

extension ActiveDonationsViewController: UICollectionViewDataSource {

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _viewModel.count()
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ActiveDonationCell = collectionView.dequeCellWithIdentifier(.ActiveDonationCell, forIndexPath: indexPath.row)

        cell.bindViewModel(_viewModel[indexPath.row])

        return cell
    }

}

private extension ActiveDonationsViewController {

    func initializeCollectionView() {
        // TODO: change MyCell
        _activeDonationsView.activeDonationsCollectionView.dataSource = self
        _activeDonationsView.activeDonationsCollectionView.collectionViewLayout = createFlowLayout()
        _activeDonationsView.activeDonationsCollectionView.registerCell(.ActiveDonationCell)


    }

    func createFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        // TODO: take this faked number out
        layout.itemSize = CGSize(width: view.frame.width,
                                 height: 187)
        layout.minimumInteritemSpacing = 40
        layout.scrollDirection = UICollectionViewScrollDirection.vertical

        return layout
    }

    func bindViewModel() {

    }

}
