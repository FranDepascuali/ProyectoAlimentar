//
//  DonationDescriptionView.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/10/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import Core

public final class DonationDescriptionView: UIView, NibLoadable {
 
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = "Descripción"
            descriptionLabel.setFont(pointSize: 16)
            descriptionLabel.textColor = .blackColor()
        }
    }
  
    @IBOutlet weak var descriptionTextView: UITextView! {
        didSet {
            descriptionTextView.scrollEnabled = false
            descriptionTextView.editable = false
            descriptionTextView.textColor = ColorPalette.secondaryTextColor
            descriptionTextView.setFont(pointSize: 14)
            descriptionTextView.textContainerInset = UIEdgeInsetsZero
            descriptionTextView.contentInset = UIEdgeInsetsZero
            descriptionTextView.textContainer.lineFragmentPadding = 0;
            descriptionTextView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        }
    }
}
