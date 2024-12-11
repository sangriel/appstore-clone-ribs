//
//  RecentSearchWordEntity+CoreDataProperties.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/11/24.
//
//

import Foundation
import CoreData


extension RecentSearchWordEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RecentSearchWordEntity> {
        return NSFetchRequest<RecentSearchWordEntity>(entityName: "RecentSearchWordEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var term: String?

}

extension RecentSearchWordEntity : Identifiable {

}
