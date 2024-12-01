//
//  MatchSearchWordAdapter.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/30/24.
//

import Foundation
import UIKit

protocol MatchSearchWordTableViewAdapter: AnyObject,
                                          TableViewAdapter where Delegate == MatchSearchWordTableViewAdapterDelegate, DataSource == MatchSearchWordTableViewDataSource {

}

protocol MatchSearchWordTableViewAdapterDelegate : AnyObject {
    
}

protocol MatchSearchWordTableViewDataSource: AnyObject {
    var numberOfItems: Int { get }
}

final class MatchSearchWordTableViewAdapterImp : NSObject,  MatchSearchWordTableViewAdapter {
    
    weak var delegate: Delegate?
    weak var dataSource: DataSource?
    
    init(tableView : UITableView) {
        super.init()
        tableView.register(MatchSearchWordCell.self, forCellReuseIdentifier: MatchSearchWordCell.cellId)
    }
    
    func setTableView(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension MatchSearchWordTableViewAdapterImp : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.numberOfItems ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MatchSearchWordCell.cellId, for: indexPath) as! MatchSearchWordCell
        return cell
    }
}
extension MatchSearchWordTableViewAdapterImp : UITableViewDelegate {
    
}
