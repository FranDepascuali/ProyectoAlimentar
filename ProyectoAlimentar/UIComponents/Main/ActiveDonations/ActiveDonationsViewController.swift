//
//  ActiveDonationsViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/24/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public final class ActiveDonationsViewController: UIViewController {

    private let _viewModel: ActiveDonationsViewModel

    private lazy var _activeDonationsView = ActiveDonationsView.loadFromNib()!

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

    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        _activeDonationsView.activeDonationsCollectionView.collectionViewLayout.invalidateLayout()
        _activeDonationsView.activeDonationsCollectionView.collectionViewLayout = createFlowLayout()
        _activeDonationsView.activeDonationsCollectionView.reloadData()
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        initializeCollectionView()
        bindViewModel()
    }

}

extension ActiveDonationsViewController: UICollectionViewDataSource {

    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _viewModel._donations.count
    }

    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Mycell", forIndexPath: NSIndexPath(forItem: indexPath.row, inSection: 0)) as! DonationDetailCell


        let fakeDonation = Donation(id: 0)

        cell.distanceToPlaceLabel.text = "\(fakeDonation.distance)km"
        cell.locationLabel.text = fakeDonation.placeDirection
        cell.placeNameLabel.text = fakeDonation.placeName

        cell.timeOpenedLabel.text = fakeDonation.from + " - " + fakeDonation.to
        cell.placeImageView.image = UIImage(named: "restaurant_placeholder")!

        return cell
    }

}

private extension ActiveDonationsViewController {

    private func initializeCollectionView() {
        // TODO: change MyCell
        _activeDonationsView.activeDonationsCollectionView.dataSource = self
        _activeDonationsView.activeDonationsCollectionView.collectionViewLayout = createFlowLayout()
        _activeDonationsView.activeDonationsCollectionView.registerNib(UINib(nibName: "DonationDetailCell", bundle: nil), forCellWithReuseIdentifier: "Mycell")


    }

    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        // TODO: take this faked number out
        layout.itemSize = CGSize(width: view.frame.width,
                                 height: 158)
        layout.minimumInteritemSpacing = 40
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical

        return layout
    }

    private func bindViewModel() {

    }

}
