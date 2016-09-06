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
    
    public var selectedMapType: MapType = MapType.Donor {
        didSet {
            switch selectedMapType {
            case .Donor:
                donorsButton.addBorder(to: .Bottom, filledWith: ColorPalette.primaryColor, width: 2)
            default:
                communityKitchenButton.addBorder(to: .Bottom, filledWith: ColorPalette.primaryColor, width: 2)
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
        }
    }
    
    
    @IBOutlet weak var communityKitchenButton: UIButton! {
        didSet {
            communityKitchenButton.setTitle("Comedores", forState: .Normal)
        }
    }
    
}