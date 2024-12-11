//
//  DefaultSearchPersistanceRepository.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/11/24.
//

import Foundation
import CoreData
import Combine


final class DefaultSearchPersistanceRepository : SearchPersistanceRepository {
   
    private let persistanceStorage : CoreDataStorage = CoreDataStorage.shared
    
    func getRecentSearchWord(term: String) -> AnyPublisher<[RecentSearchWord], any Error> {
        return Empty<[RecentSearchWord], any Error>()
            .eraseToAnyPublisher()
    }
    
    func saveRecentSearchWord(term: String) {
        guard term.isEmpty == false else  { return }
        persistanceStorage.performBackgroundTask { context in
            let entity = RecentSearchWordEntity(context: context)
            entity.term = term
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
}


