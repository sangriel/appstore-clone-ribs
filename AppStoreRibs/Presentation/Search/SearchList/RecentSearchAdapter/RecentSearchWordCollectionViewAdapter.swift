//
//  RecentSearchWordCollectionViewAdapter.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/30/24.
//

import Foundation
import UIKit


protocol RecentSearchWordTableViewAdapter  {
    var delegate : RecentSearchWordTableViewViewAdapterDelegate? { get set }
    var dataSource : RecentSearchWordTableViewAdapterDataSource? { get set }
    
}

protocol RecentSearchWordTableViewViewAdapterDelegate : AnyObject {
    
}

protocol RecentSearchWordTableViewAdapterDataSource : AnyObject {
    var numberOfItems : Int { get }
    
}

final class RecentSearchWordTableViewAdapterImp : NSObject, RecentSearchWordTableViewAdapter {
    weak var delegate: RecentSearchWordTableViewViewAdapterDelegate?
    weak var dataSource: RecentSearchWordTableViewAdapterDataSource?
    
    init(tableView : UITableView,
         dataSource : RecentSearchWordTableViewAdapterDataSource,
         delegate : RecentSearchWordTableViewViewAdapterDelegate) {
        super.init()
        self.dataSource = dataSource
        self.delegate = delegate
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(RecentSearchWordCell.self, forCellReuseIdentifier: RecentSearchWordCell.cellId)
    }
}
extension RecentSearchWordTableViewAdapterImp : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource?.numberOfItems ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecentSearchWordCell.cellId, for: indexPath) as! RecentSearchWordCell
        return cell
    }
}
extension RecentSearchWordTableViewAdapterImp : UITableViewDelegate {
    
}
