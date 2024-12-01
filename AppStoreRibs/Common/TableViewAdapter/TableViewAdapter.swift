//
//  TableViewAdapter.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/30/24.
//

import Foundation
import UIKit

protocol TableViewAdapter {
    associatedtype Delegate
    associatedtype DataSource
    var delegate : Delegate? { get set }
    var dataSource : DataSource? { get set }
    func setTableView(_ tableView : UITableView)
}
