//
//  RecentSearchWordUseCase.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/11/24.
//

import Foundation
import Combine

protocol RecentSearchWordUseCase {
    func getRecentSearchWord(term : String) -> AnyPublisher<[RecentSearchWord],Error>
    func saveRecentSearchWord(term : String)
}


final class DefaultRecentSearchWordUseCase : RecentSearchWordUseCase {
    
    private let recentSearchWordRepository : RecentSearchWordRepository
    
    init(recentSearchWordRepository : RecentSearchWordRepository) {
        self.recentSearchWordRepository = recentSearchWordRepository
    }
    
    func getRecentSearchWord(term: String) -> AnyPublisher<[RecentSearchWord], any Error> {
        return recentSearchWordRepository.getRecentSearchWord(term: term)
    }
    
    func saveRecentSearchWord(term: String) {
        recentSearchWordRepository.saveRecentSearchWord(term: term)
    }
}
