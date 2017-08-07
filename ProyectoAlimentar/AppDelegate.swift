//
//  AppDelegate.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 9/2/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    fileprivate var _mainCoordinator: MainCoordinator!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame:UIScreen.main.bounds)
        UIApplication.shared.statusBarStyle = .lightContent
        
//        FacebookBootstrapper.sharedInstance.bootstrap(application, launchOptions: launchOptions)
        
        _mainCoordinator = MainCoordinator(window: window!, userRepository: UserRepository(networkManager: AppEnvironment.sharedInstance.networkManager))
        _mainCoordinator.start()
        
        return true
    }

//
//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//        return FacebookBootstrapper.sharedInstance.openURL(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
//    }
// 
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        FacebookBootstrapper.sharedInstance.applicationDidBecomeActive(application)
//        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    }
    
}
