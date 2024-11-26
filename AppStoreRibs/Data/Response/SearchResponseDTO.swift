//
//  SearchResponseDTO.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/26/24.
//

import Foundation

struct SearchResponseDTO : Codable {
    let isGameCenterEnabled : Bool?
    let advisories : [String]?
    let features : [String]?
    let supportedDevices : [String]?
    let screenshotUrls : [String]?
    let ipadScreenshotUrls : [String]?
    let artworkUrl60 : String?
    let artworkUrl512 : String?
    let artworkUrl100 : String?
    let artistViewUrl : String?
    let appletvScreenshotUrls : [String]?
    let kind : String?
    let releaseNotes : String?
    let artistId : Int?
    let artistName : String?
    let genres : [String]?
    let price : Double?
    let description : String?
    let isVppDeviceBasedLicensingEnabled : Bool?
    let bundleId : String?
    let primaryGenreName : String?
    let primaryGenreId : Int?
    let trackId : Int?
    let trackName : String?
    let releaseDate : String?
    let sellerName : String?
    let genreIds : [String]?
    let currentVersionReleaseDate : String?
    let currency : String?
    let minimumOsVersion : String?
    let trackCensoredName : String?
    let languageCodesISO2A : [String]?
    let fileSizeBytes : String?
    let formattedPrice : String?
    let contentAdvisoryRating : String?
    let averageUserRatingForCurrentVersion : Double?
    let userRatingCountForCurrentVersion : Int?
    let averageUserRating : Double?
    let trackViewUrl : String?
    let trackContentRating : String?
    let version : String?
    let wrapperType : String?
    let userRatingCount : Int?
}


//MARK: - map to Domain
extension SearchResponseDTO {
    
    func toSearchResult() -> SearchResult {
        return .init(appIconUrl: self.artworkUrl100 ?? "",
                     titleLabel: self.trackName ?? "",
                     subTitleLabel: self.genres?.prefix(3).joined(separator: ",") ?? "",
                     averageRating: self.averageUserRating ?? -1,
                     userRatingCount: self.userRatingCount ?? -1,
                     screenShotUrls: self.screenshotUrls ?? [],
                     bundleId: self.bundleId ?? "")
    }
}
