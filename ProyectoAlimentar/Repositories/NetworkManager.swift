//
//  NetworkExecutorRepository.swift
//  ProyectoAlimentar
//
//  Created by Francisco Depascuali on 11/12/16.
//  Copyright © 2016 Alimentar. All rights reserved.
//

import Foundation
import ReactiveSwift
//import Alamofire
import enum Result.NoError

public typealias JSON = AnyObject

public protocol NetworkManagerType {
    
//    init(baseURL: String)
    
    func request() -> SignalProducer<JSON, NoError>
}

open class NetworkManager: NetworkManagerType {
    public init(baseURL: String) {
        
    }
    
    public func request() -> SignalProducer<JSON, NoError> {
        return .empty
    }
}

//
//open class NetworkManager: NetworkManagerType {
//
//    fileprivate let _baseURL: String
//    
//    public required init(baseURL: String = CredentialsManager.sharedInstance[.ApiURL]!) {
//        print("Network manager initialized using URL: " + baseURL)
//        _baseURL = baseURL
//    }
//    
//    open func request(_ method: Alamofire.Method,
//                        URL URLString: String,
//                          parameters: [String : AnyObject]? = nil,
//                          encoding: Alamofire.ParameterEncoding = .json,
//                          headers: [String : String]? = nil) -> SignalProducer<JSON, NoError> {
////        return SignalProducer { [unowned self] observer, _ in
////            print(self._baseURL + URLString)
////            Alamofire.request(method, self._baseURL + URLString, parameters: parameters, encoding: encoding, headers: headers)
////                .responseJSON { response in
////                    print(response.request)  // original URL request
////                    print(response.response) // URL response
////                    print(response.data)     // server data
////                    print(response.result)   // result of response serialization
////                    
////                    
////                    if let JSON = response.result.value {
////                        print("JSON: \(JSON)")
////                        observer.sendNext(JSON)
////                        observer.sendCompleted()
////                    } else {
////                        print("Error: \(response.result.debugDescription)")
////                    }
////            }
////        }
//    }
//}

