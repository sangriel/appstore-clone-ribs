//
//  SearchRepository.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/1/24.
//

import Foundation
import Combine


protocol SearchRepository {
    func search(term: String) -> AnyPublisher<[SearchResult], Error>
}


