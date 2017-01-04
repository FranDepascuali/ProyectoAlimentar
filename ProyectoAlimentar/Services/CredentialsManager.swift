//
//  CredentialsManagerService.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/28/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation

public enum CredentialsManagerKeys: String {
    case ApiURL
}

public protocol CredentialsManagerType {
    
    subscript(credentialKey: CredentialsManagerKeys) -> String? { get }
    
}

public struct CredentialsManager: CredentialsManagerType {
    
    public static let sharedInstance = CredentialsManager(bundle: NSBundle.mainBundle())
    
    private let credentials: [String: String]
    
    public init(bundle: NSBundle = NSBundle.mainBundle()) {
        if let credentials = bundle.infoDictionary?["Services Credentials"] as? [String: String] {
            self.credentials = credentials
        } else {
            assertionFailure("Services credentials dictionary is not available in \(bundle)'s Info.plist")
            self.credentials = [:]
        }
    }
    
    public subscript(credentialKey: CredentialsManagerKeys) -> String? {
        return credentials[credentialKey.rawValue]
    }
    
}
