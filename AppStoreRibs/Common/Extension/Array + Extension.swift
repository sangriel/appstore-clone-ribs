//
//  Array + Extension.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/1/24.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
