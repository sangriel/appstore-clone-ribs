//
//  ImageDownloader.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/1/24.
//

import Foundation
import Combine
import UIKit


struct ImageDownloader {
    
    //async await 써보고 싶어서 써봄...
    static func download(from urlString: String) async throws -> UIImage {
        guard let imageUrl = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: imageUrl)
        
        guard let image = UIImage(data: data) else {
            throw NetworkError.requestFailed("unable to create image from data")
        }
        
        return image
    }
    
}
