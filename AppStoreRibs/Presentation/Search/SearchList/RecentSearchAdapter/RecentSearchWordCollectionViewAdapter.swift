//
//  RecentSearchWordCollectionViewAdapter.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/30/24.
//

import Foundation
import UIKit


protocol RecentSearchWordTableViewAdapter : AnyObject,
                                            TableViewAdapter where Delegate == RecentSearchWordTableViewViewAdapterDelegate, DataSource == RecentSearchWordTableViewAdapterDataSource {
}

protocol RecentSearchWordTableViewViewAdapterDelegate : AnyObject {
    
}

protocol RecentSearchWordTableViewAdapterDataSource : AnyObject {
    var numberOfItems : Int { get }
    func getRecentSearchWord(at IndexPath : IndexPath) -> RecentSearchWord?
}

final class RecentSearchWordTableViewAdapterImp : NSObject, RecentSearchWordTableViewAdapter {
    weak var delegate: Delegate?
    weak var dataSource: DataSource?
    
    init(tableView : UITableView) {
        super.init()
        tableView.register(RecentSearchWordCell.self, forCellReuseIdentifier: RecentSearchWordCell.cellId)
        tableView.register(RecentSearchWordHeader.self, forHeaderFooterViewReuseIdentifier: RecentSearchWordHeader.headerViewId)
    }
    
    func setTableView(_ tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
    }
    
}
extension RecentSearchWordTableViewAdapterImp : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.numberOfItems ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecentSearchWordCell.cellId, for: indexPath) as! RecentSearchWordCell
        if let recentSearchWord = dataSource?.getRecentSearchWord(at: indexPath) {
            cell.configureCell(recentSearchWord: recentSearchWord)
        }
        return cell
    }
}
extension RecentSearchWordTableViewAdapterImp : UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: RecentSearchWordHeader.headerViewId) as! RecentSearchWordHeader
        
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40 + 20
    }
}
