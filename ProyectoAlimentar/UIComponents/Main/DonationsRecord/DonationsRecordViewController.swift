//
//  DonationRecordViewController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/29/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import Cartography

public final class DonationsRecordViewController: UIViewController {
    
    private let _viewModel: DonationsRecordsViewModel
    
    private lazy var _donationsRecordView = DonationsRecordView.loadFromNib()!
    
    public init(viewModel: DonationsRecordsViewModel) {
        _viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        view = _donationsRecordView
    }
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        _donationsRecordView.donationsRecordCollectionView.collectionViewLayout.invalidateLayout()
        _donationsRecordView.donationsRecordCollectionView.collectionViewLayout = createFlowLayout()
        _donationsRecordView.donationsRecordCollectionView.reloadData()
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        initializeCollectionView()
        bindViewModel()
        
//        
//        constrain(_donationsRecordView, self.topLayoutGuide) {
//            
//        }
        
//        _donationsRecordView.translatesAutoresizingMaskIntoConstraints = false
//        self._donationsRecordView.topAnchor
//            .constraintEqualToAnchor( self.topLayoutGuide.bottomAnchor ).active = true
    }
    
}

extension DonationsRecordViewController: UICollectionViewDataSource {
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _viewModel._donations.count
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: DonationRecordCell = collectionView.dequeCellWithIdentifier(.DonationRecordCell, forIndexPath: indexPath)
        
        
        let fakeDonation = Donation(id: 0)
        let viewModel = DonationDetailCellViewModel(donation: fakeDonation)
        cell.bindViewModel(viewModel)
        
        return cell
    }
    
}

private extension DonationsRecordViewController {
    
    private func initializeCollectionView() {
        // TODO: change MyCell
        _donationsRecordView.donationsRecordCollectionView.dataSource = self
        _donationsRecordView.donationsRecordCollectionView.collectionViewLayout = createFlowLayout()
        _donationsRecordView.donationsRecordCollectionView.registerCell(.DonationRecordCell)
        
    }
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        // TODO: take this faked number out
        layout.itemSize = CGSize(width: view.frame.width,
                                 height: 112)
        layout.minimumInteritemSpacing = 40
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        
        return layout
    }
    
    private func bindViewModel() {
        
    }
    
}
