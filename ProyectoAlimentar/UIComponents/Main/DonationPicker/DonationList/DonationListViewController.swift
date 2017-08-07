//
//  DonationsListViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/18/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import ReactiveSwift

public final class DonationListViewController: UIViewController {

    fileprivate var _donationsCarouselController: CarouselController!

    fileprivate let _viewModel: DonationListViewModel
    
    fileprivate let _onConfirmDonation: (Donation) -> ()

    public init(viewModel: DonationListViewModel, onConfirmDonation: @escaping (Donation) -> ()) {
        _viewModel = viewModel
        _onConfirmDonation = onConfirmDonation
        
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

    public func carousel(_ carousel: CarouselController, didSelectItemAtIndex index: Int) {
        _viewModel.selectDonationAt(index)
    }

    public func carousel(_ carousel: CarouselController, cellForRowAtCarouselIndex index: Int) -> UICollectionViewCell {
        let cell = carousel.collectionView?.dequeCellWithIdentifier(.DonationDetailCell, forIndexPath: index) as! DonationDetailCell

        cell.bindViewModel(_viewModel[index], onConfirmDonation: _onConfirmDonation)
        
        return cell
    }

    public func numberOfItems(_ carousel: CarouselController) -> Int {
        return _viewModel.donationsCount
    }

    fileprivate func createFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        // TODO: take this faked number out
        layout.itemSize = CGSize(width: view.frame.width - 40,
                                 height: 158)
        layout.minimumInteritemSpacing = 40
        //        layout.minimumLineSpacing = SessionTrickListController.MinimumLineSpacing
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal

        return layout
    }
}

private extension DonationListViewController {

    func initializeDonationCarouselController() {
        _donationsCarouselController = CarouselController(collectionViewLayout: createFlowLayout())
        _donationsCarouselController.collectionView!.showsHorizontalScrollIndicator = false
        _donationsCarouselController.collectionView!.registerCell(.DonationDetailCell)
        _donationsCarouselController.delegate = self
        load(childViewController: _donationsCarouselController, into: view)
    }

    func bindViewModel() {
        
        _viewModel.donations
            .producer
            .observe(on: UIScheduler())
            .startWithValues { _ in
                self._donationsCarouselController.collectionView?.reloadData()
        }
        
        _viewModel.selected
            .observeValues { [unowned self] in self._donationsCarouselController.setSelected($0) }
    }
}
