//
//  CarouselController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/5/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import ReactiveSwift

@objc
public protocol CarouselControllerDelegate {

    func carousel(_ carousel: CarouselController, didSelectItemAtIndex index: Int)

    func carousel(_ carousel: CarouselController, cellForRowAtCarouselIndex index: Int) -> UICollectionViewCell

    func numberOfItems(_ carousel: CarouselController) -> Int
}

open class CarouselController: UICollectionViewController {

    fileprivate var _selected: Int = 0

    fileprivate var _lastOffset: CGFloat = 0

    open weak var delegate: CarouselControllerDelegate?

    open var itemCount: Int {
        return delegate?.numberOfItems(self) ?? 0
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        collectionView?.backgroundColor = .clear
    }

    open func setSelected(_ index: Int) {
        _selected = toInternalIndex(index)
        scrollToItem(_selected, animated: true)
    }

}

extension CarouselController {

    override open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount > 0 ? itemCount + 2 : 0
    }

    override open func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _selected = indexPath.row
        scrollToItemNotifyingDelegate(indexPath.row, animated: true)
    }

    override open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = fromInternalIndex(indexPath.row)
        return delegate!.carousel(self, cellForRowAtCarouselIndex: index)
    }
}

extension CarouselController {

    override open func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        _lastOffset = scrollView.contentOffset.x
    }

    override open func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint,
                                                   targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let currentOffset = CGFloat(scrollView.contentOffset.x)

        if currentOffset == _lastOffset {
            return
        }

        let lastPosition = _selected
        if currentOffset > _lastOffset { // When Moving to the right
            if lastPosition < itemCount {
                _selected = lastPosition + 1 // Move to the right
                self.scrollToItemNotifyingDelegate(_selected, animated: true)
            } else {
                self.scrollToItem(itemCount + 1, animated: true) // Scroll to copy of first item
            }
        } else if currentOffset < _lastOffset { // When moving to the left
            if lastPosition == 1 {
                self.scrollToItem(0, animated: true) // Scroll to copy of last item
            } else {
                _selected = lastPosition - 1
                self.scrollToItemNotifyingDelegate(_selected, animated: true) // Move to the left
            }
        }
    }

    override open func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if let indexPath = collectionView?.centerCellIndexPath {
            let position = indexPath.row
            // If we are at the copy of the last item we scroll to it
            if position == 0 {
                _selected = itemCount
                self.scrollToItemNotifyingDelegate(_selected, animated: false)
            } else if position == itemCount + 1 {
                _selected = 1
                // If we are at the copy of the first item we scroll to it
                self.scrollToItemNotifyingDelegate(_selected, animated: false)
            }
        }
    }
}

private extension CarouselController {

    // Carousel has a copy of the last element in first position and a copy of first element in last position (to simulate infinte scrolling).

    // Get carousel internal index from real data index
    func toInternalIndex(_ index: Int) -> Int {
        return index + 1
    }

    // Get real index from carousel internal index
    func fromInternalIndex(_ position: Int) -> Int {
        switch position {
        case 0: return itemCount - 1
        case itemCount + 1: return 0
        default: return position - 1
        }
    }

    func scrollToItemNotifyingDelegate(_ position: Int, animated: Bool) {
        self.delegate?.carousel(self, didSelectItemAtIndex: fromInternalIndex(position))
        self.scrollToItem(position, animated: animated)
    }

    func scrollToItem(_ position: Int, animated: Bool) {
        DispatchQueue.main.async(execute: {
            let indexPath = IndexPath(item: position, section: 0)
            self.collectionView?.scrollToItem(at: indexPath,
                at: UICollectionViewScrollPosition.centeredHorizontally,
                animated: animated)
        })
    }
}
