//
//  SearchResultTableViewAdapter.swift
//  AppStoreRibs
//
//  Created by sangmin han on 12/1/24.
//

import Foundation
import UIKit


protocol SearchResultTableViewAdapter : AnyObject,
                                        TableViewAdapter where Delegate == SearchResultTableViewAdapterDelegate, DataSource == SearchResultTableViewAdapterDataSource {
    
}

protocol SearchResultTableViewAdapterDelegate : AnyObject {

}

protocol SearchResultTableViewAdapterDataSource : AnyObject {
    var numberOfItems : Int { get }
    func getSearchResult(at IndexPath : IndexPath) -> SearchResult?
}

final class SearchResultTableViewAdapterImp : NSObject, SearchResultTableViewAdapter {
    var delegate: Delegate?
    
    var dataSource: DataSource?
    
    init(tableView : UITableView) {
        super.init()
        tableView.register(SearchResultCell.self, forCellReuseIdentifier: SearchResultCell.cellId)
    }
    
    func setTableView(_ tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
    }
}
extension SearchResultTableViewAdapterImp : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.numberOfItems ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultCell.cellId, for: indexPath) as! SearchResultCell
        if let searchResult = dataSource?.getSearchResult(at: indexPath) {
            cell.configureCell(searchResult: searchResult)
        }
        return cell
    }
}
extension SearchResultTableViewAdapterImp : UITableViewDelegate {
    
}
