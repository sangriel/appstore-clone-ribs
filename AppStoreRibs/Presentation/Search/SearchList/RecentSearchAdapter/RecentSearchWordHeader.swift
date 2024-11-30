//
//  RecentSearchWordHeader.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/30/24.
//

import Foundation
import UIKit


class RecentSearchWordHeader : UITableViewHeaderFooterView {
    
    static let headerViewId = "tablerecentsearchwordheaderviewid"
    
    let label : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.backgroundColor = .white
        lb.textColor = .black
        lb.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lb.text = "최근 검색어"
        return lb
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setLayout()
        
        self.contentView.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
extension RecentSearchWordHeader {
    
    private func setLayout(){
        self.addSubview(label)
        NSLayoutConstraint.activate([
            
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            label.topAnchor.constraint(equalTo: self.topAnchor,constant: 20),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
