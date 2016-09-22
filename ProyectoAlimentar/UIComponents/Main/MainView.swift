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
    case Donor
    case CommunityKitchen
}

public final class MainView: UIView, NibLoadable {
    
    @IBOutlet weak var donorsButtonBottomLine: UIView! {
        didSet {
            donorsButtonBottomLine.backgroundColor = .clearColor()
        }
    }
    
    @IBOutlet weak var communityKitchenButtonBottomLine: UIView! {
        didSet {
            communityKitchenButtonBottomLine.backgroundColor = .clearColor()
        }
    }
    
    public var selectedMapType: MapType = .Donor {
        didSet {
            switch selectedMapType {
            case .Donor:
                // We need to reset the colors of the other button
                communityKitchenButtonBottomLine.backgroundColor = .clearColor()
                communityKitchenButton.setTitleColor(ColorPalette.secondaryTextColor, forState: .Normal)
                
                donorsButtonBottomLine.backgroundColor = ColorPalette.primaryColor
                donorsButton.setTitleColor(ColorPalette.primaryColor, forState: .Normal)
            case .CommunityKitchen:
                // We need to reset the colors of the other button
                donorsButtonBottomLine.backgroundColor = .clearColor()
                donorsButton.setTitleColor(ColorPalette.secondaryTextColor, forState: .Normal)
                
                communityKitchenButtonBottomLine.backgroundColor = ColorPalette.primaryColor
                communityKitchenButton.setTitleColor(ColorPalette.primaryColor, forState: .Normal)
            }
        }
    }
    
    @IBOutlet weak var searchContainerView: UIView! {
        didSet {
            searchContainerView.backgroundColor = .clearColor()
            
            // TODO: this should be on the search view when implemented
            searchContainerView.backgroundColor = ColorPalette.primaryColor
        }
    }
    
    @IBOutlet weak var mapContainerView: UIView! {
        didSet {
           mapContainerView.backgroundColor = .clearColor()
        }
    }
    
    @IBOutlet weak var donationDetailContainerView: UIView! {
        didSet {
            donationDetailContainerView.backgroundColor = .clearColor()
        }
    }
    
    @IBOutlet weak var donorsButton: UIButton! {
        didSet {
            donorsButton.setTitle("Donantes", forState: .Normal)
            donorsButton.setTitleColor(ColorPalette.secondaryTextColor, forState: .Normal)
            donorsButton.titleLabel?.setFont(pointSize: 14)
            donorsButton.titleLabel!.addCharactersSpacing(0.5)
        }
    }
    
    
    @IBOutlet weak var communityKitchenButton: UIButton! {
        didSet {
            communityKitchenButton.setTitle("Comedores", forState: .Normal)
            communityKitchenButton.setTitleColor(ColorPalette.secondaryTextColor, forState: .Normal)
            communityKitchenButton.titleLabel?.setFont(pointSize: 14)
            communityKitchenButton.titleLabel!.addCharactersSpacing(0.5)
        }
    }
    
}
