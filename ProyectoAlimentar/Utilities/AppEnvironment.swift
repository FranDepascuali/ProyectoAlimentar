//
//  Environment.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 1/4/17.
//  Copyright © 2017 Alimentar. All rights reserved.
//

import Foundation

public protocol AppEnvironmentType {
    
}

public final class AppEnvironment: AppEnvironmentType {
    
    public static let sharedInstance = AppEnvironment()
    
    // TODO: Change type to NetworkManagerType
    public let networkManager: NetworkManager = createNetworkManager()
    
}

private func createNetworkManager() -> NetworkManager {
    let ApiURL = CredentialsManager.sharedInstance[.ApiURL]
    
    precondition(ApiURL != nil && ApiURL != "" , "Api key must not be null. Check configuration files")
    let _ApiURL = "https://" + ApiURL!
    print("API URL: \(_ApiURL)")
    
    let networkManager = NetworkManager(baseURL: _ApiURL)
    return networkManager
}
