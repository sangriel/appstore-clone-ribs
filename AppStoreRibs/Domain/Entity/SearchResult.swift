//
//  SearchResult.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/26/24.
//

import Foundation


struct SearchResult {
    let appIconUrl : String
    let titleLabel : String
    let subTitleLabel : String
    let averageRating : Double
    let userRatingCount : String
    let screenShotUrls : [String]
    let bundleId : String
    
    init(appIconUrl: String, titleLabel: String, subTitleLabel: String, averageRating: Double, userRatingCount: Int, screenShotUrls: [String],bundleId : String) {
        self.appIconUrl = appIconUrl
        self.titleLabel = titleLabel
        self.subTitleLabel = subTitleLabel
        self.averageRating = averageRating
        self.userRatingCount = userRatingCount.abstractedNumberString
        self.screenShotUrls = screenShotUrls
        self.bundleId = bundleId
    }
}
