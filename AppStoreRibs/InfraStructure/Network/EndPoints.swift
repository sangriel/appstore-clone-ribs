//
//  APIEndpoints.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/24/24.
//

import Foundation


enum HTTPMethod : String {
    case GET
    case POST
    case PUT
    case DELETE
}

protocol EndPoints {
    associatedtype Response : Decodable
    
    var baseUrl : String { get  }
    var path : String { get }
    var method : HTTPMethod { get }
    var parameter : [String : Any]? { get }
    var header : [String : String] { get }
}

extension EndPoints {
    var baseUrl : String {
        return "https://itunes.apple.com"
    }
    
    var header : [String : String] {
        return [:]
    }
}



