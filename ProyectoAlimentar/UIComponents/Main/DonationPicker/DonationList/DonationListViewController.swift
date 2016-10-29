//
//  DonationsListViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/18/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

public final class DonationListViewController: UIViewController {

    private var _donationsCarouselController: CarouselController!

    private let _viewModel: DonationListViewModel

    init(viewModel: DonationListViewModel) {
        _viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        initializeDonationCarouselController()
        bindViewModel()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension DonationListViewController: CarouselControllerDelegate {

    public func carousel(carousel: CarouselController, didSelectItemAtIndex index: Int) {
        _viewModel.selectDonationAt(index)

    }

    public func carousel(carousel: CarouselController, cellForRowAtCarouselIndex index: Int) -> UICollectionViewCell {
        let cell = carousel.collectionView?.dequeueReusableCellWithReuseIdentifier("Mycell", forIndexPath: NSIndexPath(forItem: index, inSection: 0)) as! DonationDetailCell


        let fakeDonation = Donation(id: 0)

        cell.distanceToPlaceLabel.text = "\(fakeDonation.distance)km"
        cell.locationLabel.text = fakeDonation.placeDirection
        cell.placeNameLabel.text = fakeDonation.placeName

        cell.timeOpenedLabel.text = fakeDonation.from + " - " + fakeDonation.to
        cell.placeImageView.image = UIImage(named: "restaurant_placeholder")!

        return cell
    }

    public func numberOfItems(carousel: CarouselController) -> Int {
        return _viewModel.donationsCount
    }

    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        // TODO: take this faked number out
        layout.itemSize = CGSize(width: view.frame.width - 40,
                                 height: 158)
        layout.minimumInteritemSpacing = 40
        //        layout.minimumLineSpacing = SessionTrickListController.MinimumLineSpacing
        layout.scrollDirection = UICollectionViewScrollDirection.Horizontal

        return layout
    }
}

private extension DonationListViewController {

    private func initializeDonationCarouselController() {
        _donationsCarouselController = CarouselController(collectionViewLayout: createFlowLayout())
        _donationsCarouselController.collectionView!.showsHorizontalScrollIndicator = false
        _donationsCarouselController.collectionView!.registerNib(UINib(nibName: "DonationDetailCell", bundle: nil), forCellWithReuseIdentifier: "Mycell")
        _donationsCarouselController.delegate = self
        loadViewController(_donationsCarouselController, into: view)
    }

    private func bindViewModel() {
        _viewModel.selected
            .observeNext { [unowned self] in self._donationsCarouselController.setSelected($0) }
    }
}
