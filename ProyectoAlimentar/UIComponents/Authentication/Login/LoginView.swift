//
//  LoginView.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 10/20/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import Core

public final class LoginView: UIView, NibLoadable {

    @IBOutlet weak var logoImageView: UIImageView! {
        didSet {
            logoImageView.image = UIImage(identifier: .LoginLogo)
        }
    }

    @IBOutlet weak var termsAndConditionsLabel: UILabel!

    @IBOutlet weak var backgroundImageView: UIImageView! {
        didSet {
            backgroundImageView.image = UIImage(identifier: .LoginBackgroundImage)
        }
    }
}
