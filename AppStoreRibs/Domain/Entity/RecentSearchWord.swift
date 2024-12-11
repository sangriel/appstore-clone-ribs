//
//  RecentSearchWord.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/10/24.
//

import Foundation

struct RecentSearchWord {
    let id : Int64
    let searchWord : String
   
    init(id : Int64, searchWord : String) {
        self.id = id
        self.searchWord = searchWord
    }
}
