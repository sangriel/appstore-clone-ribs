//
//  DefaultRecentSearchWordRepository.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/11/24.
//

import Foundation
import Combine



final class DefaultRecentSearchWordRepository : RecentSearchWordRepository {
    
    private let storage : RecentSearchWordStorage
    
    init(storage: RecentSearchWordStorage = CoreDataRecentSearchWordStorage()) {
        self.storage = storage
    }
    
    func getRecentSearchWord(term: String) -> AnyPublisher<[RecentSearchWord], any Error> {
        return storage.getRecentSearchWord(term: term)
    }
    
    func saveRecentSearchWord(term: String) {
        storage.saveRecentSearchWord(term: term)
    }
}
