//
//  RecentSearchWordRepository.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/11/24.
//

import Foundation
import Combine


protocol RecentSearchWordRepository {
    func getRecentSearchWord(term : String) -> AnyPublisher<[RecentSearchWord],Error>
    
    func saveRecentSearchWord(term : String)
}
