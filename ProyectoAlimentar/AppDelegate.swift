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

    private var _mainCoordinator: MainCoordinator!
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame:UIScreen.mainScreen().bounds)
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        FacebookBootstrapper.sharedInstance.bootstrap(application, launchOptions: launchOptions)
        
        _mainCoordinator = MainCoordinator(window: window!, userRepository: UserRepository(networkManager: createNetworkManager()))
        _mainCoordinator.start()
        
        return true
    }


    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FacebookBootstrapper.sharedInstance.openURL(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
 
    func applicationDidBecomeActive(application: UIApplication) {
        FacebookBootstrapper.sharedInstance.applicationDidBecomeActive(application)
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    private func createNetworkManager() -> NetworkManager {
        let ApiURL = CredentialsManager.sharedInstance[.ApiURL]
        
        precondition(ApiURL != nil && ApiURL != "" , "Api key must not be null. Check configuration files")
        let _ApiURL = "https://" + ApiURL!
        print("API URL: \(_ApiURL)")
        
        let networkManager = NetworkManager(baseURL: _ApiURL)
        return networkManager
    }


}
