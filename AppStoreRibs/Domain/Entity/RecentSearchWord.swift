//
//  RecentSearchWord.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/10/24.
//

import Foundation

struct RecentSearchWord {
    let id : String
    let searchWord : String
   
    init(id : String, searchWord : String) {
        self.id = id
        self.searchWord = searchWord
    }
}
