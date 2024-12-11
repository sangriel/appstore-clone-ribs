//
//  RecentSearchWordEntity + Mapping.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/11/24.
//

import Foundation


extension RecentSearchWordEntity {
    func toRecentSearchWord() -> RecentSearchWord {
        return .init(id: self.id ?? "",
                     searchWord: self.term ?? "")
    }
}
