//
//  SearchListResponseDTO.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/26/24.
//

import Foundation


struct SearchListResponseDTO: Codable {
    let resultCount : Int?
    let results : [SearchResponseDTO]
}
