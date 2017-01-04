//
//  NetworkExecutorRepository.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/12/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import ReactiveCocoa
import Alamofire
import enum Result.NoError

public typealias JSON = AnyObject

public protocol NetworkManagerType {
    
    init(baseURL: String)
    
    func request(method: Alamofire.Method,
                 URL URLString: URLStringConvertible,
                     parameters: [String : AnyObject]?,
                     encoding: Alamofire.ParameterEncoding,
                     headers: [String : String]?) -> SignalProducer<JSON, NoError>
}

public class NetworkManager: NetworkManagerType {

    private let _baseURL: String
    
    public required init(baseURL: String = CredentialsManager.sharedInstance[.ApiURL]!) {
        print("Network manager initialized using URL: " + baseURL)
        _baseURL = baseURL
    }
    
    public func request(method: Alamofire.Method,
                        URL URLString: URLStringConvertible,
                          parameters: [String : AnyObject]? = nil,
                          encoding: Alamofire.ParameterEncoding = .JSON,
                          headers: [String : String]? = nil) -> SignalProducer<JSON, NoError> {
        return SignalProducer { [unowned self] observer, _ in
            print(self._baseURL + URLString.URLString)
            Alamofire.request(method, self._baseURL + URLString.URLString, parameters: parameters, encoding: encoding, headers: headers)
                .responseJSON { response in
                    print(response.request)  // original URL request
                    print(response.response) // URL response
                    print(response.data)     // server data
                    print(response.result)   // result of response serialization
                    
                    
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                        observer.sendNext(JSON)
                        observer.sendCompleted()
                    } else {
                        print("Error: \(response.result.debugDescription)")
                    }
            }
        }
    }
}

