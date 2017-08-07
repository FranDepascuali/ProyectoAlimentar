//
//  KeychainManagerService.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/28/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import Security

// Constant Identifiers
let userAccount = "AuthenticatedUser"
let accessGroup = "SecuritySerivice"

let emailKey = "email"
let usernameKey = "username"
let nameKey = "name"

/**
 *  User defined keys for new entry
 *  Note: add new keys for new secure item and use them in load and save methods
 */

// Arguments for the keychain queries
let kSecClassValue = NSString(format: kSecClass)
let kSecAttrAccountValue = NSString(format: kSecAttrAccount)
let kSecValueDataValue = NSString(format: kSecValueData)
let kSecClassGenericPasswordValue = NSString(format: kSecClassGenericPassword)
let kSecAttrServiceValue = NSString(format: kSecAttrService)
let kSecMatchLimitValue = NSString(format: kSecMatchLimit)
let kSecReturnDataValue = NSString(format: kSecReturnData)
let kSecMatchLimitOneValue = NSString(format: kSecMatchLimitOne)

// http://stackoverflow.com/questions/37539997/save-and-load-from-keychain-swift
open class KeychainService: NSObject {
    
    /**
     * Exposed methods to perform save and load queries.
     */
    
    open static let sharedInstance = KeychainService()
    
    fileprivate override init() {}
    
    open func saveUser(_ user: User) {
        print("Saving user \(user) to keychain")
        
        save(emailKey as NSString, data: user.email as NSString)
        save(usernameKey as NSString, data: user.userName as NSString)
        save(nameKey as NSString, data: user.name as NSString)
    }
    
    open func loadUser() -> User? {
        guard
            let email = load(emailKey as NSString),
            let username = load(usernameKey as NSString),
            let name = load(nameKey as NSString)
            else {
                print("unable to load user from keychain")
                return nil
        }
        let user = User(email: email as String, userName: username as String, name: name as String)
        print("User \(user) loaded from keychain")
        return user
    }

    /**
     * Internal methods for querying the keychain.
     */
    
    fileprivate func save(_ service: NSString, data: NSString) {
        let dataFromString: Data = data.data(using: String.Encoding.utf8.rawValue, allowLossyConversion: false)!
        
        // Instantiate a new default keychain query
        let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, userAccount, dataFromString], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue, kSecValueDataValue])
        
        // Delete any existing items
        SecItemDelete(keychainQuery as CFDictionary)
        
        // Add the new keychain item
        SecItemAdd(keychainQuery as CFDictionary, nil)
    }
    
    open func resetKeychain() {
        self.deleteAllKeysForSecClass(kSecClassGenericPassword)
        self.deleteAllKeysForSecClass(kSecClassInternetPassword)
        self.deleteAllKeysForSecClass(kSecClassCertificate)
        self.deleteAllKeysForSecClass(kSecClassKey)
        self.deleteAllKeysForSecClass(kSecClassIdentity)
    }
    
    fileprivate func deleteAllKeysForSecClass(_ secClass: CFTypeRef) {
        let dict: [NSString : AnyObject] = [kSecClass : secClass]
        let result = SecItemDelete(dict as CFDictionary)
        assert(result == noErr || result == errSecItemNotFound, "Error deleting keychain data (\(result))")
    }
    
    fileprivate func load(_ service: NSString) -> NSString? {
        // Instantiate a new default keychain query
        // Tell the query to return a result
        // Limit our results to one item
        let keychainQuery: NSMutableDictionary = NSMutableDictionary(objects: [kSecClassGenericPasswordValue, service, userAccount, kCFBooleanTrue, kSecMatchLimitOneValue], forKeys: [kSecClassValue, kSecAttrServiceValue, kSecAttrAccountValue, kSecReturnDataValue, kSecMatchLimitValue])
        
        var dataTypeRef :AnyObject?
        
        // Search for the keychain items
        let status: OSStatus = SecItemCopyMatching(keychainQuery, &dataTypeRef)
        var contentsOfKeychain: NSString? = nil
        
        if status == errSecSuccess {
            if let retrievedData = dataTypeRef as? Data {
                contentsOfKeychain = NSString(data: retrievedData, encoding: String.Encoding.utf8.rawValue)
            }
        } else {
            print("Nothing was retrieved from the keychain. Status code \(status)")
        }
        
        return contentsOfKeychain
    }
}
