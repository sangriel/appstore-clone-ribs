//
//  DefaultSearchRepository.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/1/24.
//

import Foundation
import Combine


final class DefaultSearchRepository : SearchRepository {
    
    private let networkService : NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func search(term: String) -> AnyPublisher<[SearchResult], any Error> {
        let endPoint = SearchAPI(term: term)
        return networkService
            .request(endPoint: endPoint)
            .map({ result -> [SearchResult] in
                let searchResults = result.results.map { $0.toSearchResult() }
                return searchResults
            })
            .eraseToAnyPublisher()
    }
}
