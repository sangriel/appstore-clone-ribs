//
//  NetworkError.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/26/24.
//

import Foundation

enum NetworkError : Error {
    case invalidURL
    case requestFailed(String)
    case decodingFailed
}

