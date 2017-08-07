//
//  MainView.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import Core

public enum MapType {
    case donor
    case communityKitchen
}

public final class DonationPickerView: UIView, NibLoadable {
    
    fileprivate lazy var blackLayer: UIView = {
        let blackLayer = UIView(frame: self.frame)
        blackLayer.backgroundColor = UIColor(hex: "00000085")
        return blackLayer
    }()
    
    public func removeBlackOverlay() {
        blackLayer.removeFromSuperview()
    }
    
    public func addBlackOverlay() {
        addSubview(blackLayer)
        // We want confirm donation view to be visible
        bringSubview(toFront: confirmDonationContainerView)
    }
    
    @IBOutlet weak var confirmDonationContainerView: UIView! {
        didSet {
            confirmDonationContainerView.isHidden = true
        }
    }

    @IBOutlet weak var donorsButtonBottomLine: UIView! {
        didSet {
            donorsButtonBottomLine.backgroundColor = .clear
        }
    }

    @IBOutlet weak var communityKitchenButtonBottomLine: UIView! {
        didSet {
            communityKitchenButtonBottomLine.backgroundColor = .clear
        }
    }

    public var selectedMapType: MapType = .donor {
        didSet {
            switch selectedMapType {
            case .donor:
                // We need to reset the colors of the other button
                communityKitchenButtonBottomLine.backgroundColor = .clear
                communityKitchenButton.setTitleColor(ColorPalette.secondaryTextColor, for: UIControlState())

                donorsButtonBottomLine.backgroundColor = ColorPalette.primaryColor
                donorsButton.setTitleColor(ColorPalette.primaryColor, for: UIControlState())
            case .communityKitchen:
                // We need to reset the colors of the other button
                donorsButtonBottomLine.backgroundColor = .clear
                donorsButton.setTitleColor(ColorPalette.secondaryTextColor, for: UIControlState())

                communityKitchenButtonBottomLine.backgroundColor = ColorPalette.primaryColor
                communityKitchenButton.setTitleColor(ColorPalette.primaryColor, for: UIControlState())
            }
        }
    }

    @IBOutlet weak var searchContainerView: UIView! {
        didSet {
            searchContainerView.backgroundColor = .clear

            // TODO: this should be on the search view when implemented
            searchContainerView.backgroundColor = ColorPalette.primaryColor
        }
    }

    @IBOutlet weak var mapContainerView: UIView! {
        didSet {
           mapContainerView.backgroundColor = .clear
        }
    }

    @IBOutlet weak var donationDetailContainerView: UIView! {
        didSet {
            donationDetailContainerView.backgroundColor = .clear
        }
    }

    @IBOutlet weak var donorsButton: UIButton! {
        didSet {
            donorsButton.setTitle("Donantes", for: UIControlState())
            donorsButton.setTitleColor(ColorPalette.secondaryTextColor, for: UIControlState())
            donorsButton.titleLabel?.setFont(pointSize: 14)
            donorsButton.titleLabel!.addCharactersSpacing(0.5)
        }
    }


    @IBOutlet weak var communityKitchenButton: UIButton! {
        didSet {
            communityKitchenButton.setTitle("Comedores", for: UIControlState())
            communityKitchenButton.setTitleColor(ColorPalette.secondaryTextColor, for: UIControlState())
            communityKitchenButton.titleLabel?.setFont(pointSize: 14)
            communityKitchenButton.titleLabel!.addCharactersSpacing(0.5)
        }
    }

}
