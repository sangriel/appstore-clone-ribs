//
//  CoreDataRecentSearchWordStorage.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/11/24.
//

import Foundation
import Combine
import CoreData

final class CoreDataRecentSearchWordStorage {
    private let persistanceStorage = CoreDataStorage.shared
    
}
extension CoreDataRecentSearchWordStorage : RecentSearchWordStorage {
    func getRecentSearchWord(term: String) -> AnyPublisher<[RecentSearchWord], any Error> {
        Future<[RecentSearchWord],Error> { [weak self] promise in
            guard let self = self else {
                return
            }
            
            persistanceStorage.performBackgroundTask { context in
                let request: NSFetchRequest = RecentSearchWordEntity.fetchRequest()
                if term != "" {
                    request.predicate = NSPredicate(format: "%K CONTAINS %@",
                                                    #keyPath(RecentSearchWordEntity.term), term)
                }
                
                do {
                    let response = try context.fetch(request)
                    promise(.success(response.map{ $0.toRecentSearchWord() }))
                }
                catch(let error) {
                    print(error.localizedDescription)
                    promise(.failure(error))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    
    
    func saveRecentSearchWord(term: String) {
        guard term.isEmpty == false else  { return }
        persistanceStorage.performBackgroundTask { context in
            let entity = RecentSearchWordEntity(context: context)
            entity.term = term
            entity.id = UUID().uuidString
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
}
