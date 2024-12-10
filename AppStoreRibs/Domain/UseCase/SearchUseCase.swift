//
//  SearchUseCase.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/1/24.
//

import Foundation
import Combine

protocol SearchUseCase {
    func fetchRemote(term : String) -> AnyPublisher<[SearchResult],Error>
}

final class DefaultSearchUseCase : SearchUseCase {
   
    private let searchRepository: SearchRepository
    
    init(searchRepository: SearchRepository) {
        self.searchRepository = searchRepository
    }
    
    func fetchRemote(term: String) -> AnyPublisher<[SearchResult], any Error> {
        return searchRepository.search(term: term)
    }
    
}
