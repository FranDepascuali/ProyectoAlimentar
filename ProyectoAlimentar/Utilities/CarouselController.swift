//
//  CarouselController.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/5/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import ReactiveCocoa

@objc
public protocol CarouselControllerDelegate {
    
    func carousel(carousel: CarouselController, didSelectItemAtIndex index: Int)
    
    func carousel(carousel: CarouselController, cellForRowAtCarouselIndex index: Int) -> UICollectionViewCell
    
    func numberOfItems(carousel: CarouselController) -> Int
}

public class CarouselController: UICollectionViewController {
    
    private var _selected: Int = 0
    
    private var _lastOffset: CGFloat = 0
    
    public weak var delegate: CarouselControllerDelegate?
    
    public var itemCount: Int {
        return delegate?.numberOfItems(self) ?? 0
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clearColor()
        collectionView?.backgroundColor = .clearColor()
    }
    
    public func setSelected(index: Int) {
        _selected = toInternalIndex(index)
        scrollToItem(_selected, animated: true)
    }
    
}

public extension CarouselController {
    
    override public func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount + 2
    }
    
    override public func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        _selected = indexPath.row
        scrollToItemNotifyingDelegate(indexPath.row, animated: true)
    }
    
    override public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let index = fromInternalIndex(indexPath.row)
        return delegate!.carousel(self, cellForRowAtCarouselIndex: index)
    }
}

public extension CarouselController {
    
    override public func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        _lastOffset = scrollView.contentOffset.x
    }
    
    override public func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint,
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
    
    override public func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
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
    private func toInternalIndex(index: Int) -> Int {
        return index + 1
    }
    
    // Get real index from carousel internal index
    private func fromInternalIndex(position: Int) -> Int {
        switch position {
        case 0: return itemCount - 1
        case itemCount + 1: return 0
        default: return position - 1
        }
    }
    
    private func scrollToItemNotifyingDelegate(position: Int, animated: Bool) {
        self.delegate?.carousel(self, didSelectItemAtIndex: fromInternalIndex(position))
        self.scrollToItem(position, animated: animated)
    }
    
    private func scrollToItem(position: Int, animated: Bool) {
        dispatch_async(dispatch_get_main_queue(), {
            let indexPath = NSIndexPath(forItem: position, inSection: 0)
            self.collectionView?.scrollToItemAtIndexPath(indexPath,
                atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally,
                animated: animated)
        })
    }
}