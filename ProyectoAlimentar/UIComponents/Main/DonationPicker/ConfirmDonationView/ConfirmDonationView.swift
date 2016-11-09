//
//  ConfirmDonationView.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/8/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import Core

public final class ConfirmDonationView: UIView, NibLoadable {
    
    @IBOutlet weak var bigChronometerImageView: UIImageView! {
        didSet {
            bigChronometerImageView.image = UIImage(identifier: .BigChronometer)
        }
    }
    
    @IBOutlet weak var timeLabel: UILabel! {
        didSet {
            timeLabel.text = "60 min"
            timeLabel.setFont(.Bold, pointSize: 20)
            timeLabel.textColor = ColorPalette.primaryColor
        }
    }
    
    @IBOutlet weak var detailedTimeLabel: UILabel! {
        didSet {
            detailedTimeLabel.textColor = UIColor(hex: "#00000054")!
            detailedTimeLabel.setFont(pointSize: 16)
            detailedTimeLabel.text = "Tenés 60 minutos para pasar a buscar la donación"
        }
    }
    
    @IBOutlet weak var cancelButton: UIButton! {
        didSet {
            cancelButton.setTitleColor(ColorPalette.secondaryTextColor, forState: .Normal)
            cancelButton.titleLabel?.setFont(pointSize: 14)
            cancelButton.titleLabel?.addCharactersSpacing(0.5)
            cancelButton.setTitle("Cancelar", forState: .Normal)
        }
    }
    
    @IBOutlet weak var acceptButton: UIButton! {
        didSet {
            acceptButton.setTitleColor(ColorPalette.activatedColor, forState: .Normal)
            acceptButton.titleLabel?.setFont(pointSize: 14)
            acceptButton.titleLabel?.addCharactersSpacing(0.5)
            acceptButton.setTitle("Aceptar", forState: .Normal)
        }
    }
}
