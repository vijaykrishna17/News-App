//
//  NetworkConnection.swift
//  NewsApp
//

import Foundation
import ARKit
import Alamofire

class Connectivity{
    
    class func isConnectedToInterNet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
