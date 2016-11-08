//
//  FacebokBootstrapper.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/8/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

public final class FacebookBootstrapper: Bootstrapper {
    
    public static let sharedInstance = FacebookBootstrapper()
    
    private init() {}
    
    public func bootstrap(application: UIApplication, launchOptions: [NSObject : AnyObject]?) {
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    public func openURL(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return ApplicationDelegate.shared.application(application,
                                                    openURL: url,
                                                    sourceApplication: sourceApplication,
                                                    annotation: annotation)
        
    }
    
    public func applicationDidBecomeActive(application: UIApplication) {
        AppEventsLogger.activate(application)
    }
}
