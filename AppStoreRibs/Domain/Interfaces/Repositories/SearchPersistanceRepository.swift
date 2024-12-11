//
//  SearchPersistanceRepository.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/10/24.
//

import Foundation
import Combine

protocol SearchPersistanceRepository {
    func getRecentSearchWord(term : String) -> AnyPublisher<[RecentSearchWord],Error>
    
    func saveRecentSearchWord(term : String)
}
