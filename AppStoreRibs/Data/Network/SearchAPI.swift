//
//  SearchAPI.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/24/24.
//

import Foundation



struct SearchAPI : EndPoints {
    var path: String {
        "/search"
    }
    
    var method: HTTPMethod {
        .GET
    }
    
    var parameter: [String : Any]? {
        
        
        return [:]
    }
}
