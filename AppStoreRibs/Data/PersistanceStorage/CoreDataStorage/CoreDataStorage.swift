//
//  CoreDataStorage.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/11/24.
//

import Foundation
import CoreData


final class CoreDataStorage {
    static let shared = CoreDataStorage()
    
    lazy private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SearchList")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved error, \((error as NSError).userInfo)")
            }
        })
        return container
    }()
    
    
    func performBackgroundTask(_ block: @escaping (NSManagedObjectContext) -> Void) {
        persistentContainer.performBackgroundTask(block)
    }
}
