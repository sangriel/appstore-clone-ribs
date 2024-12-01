//
//  RecentSearchWordCell.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/30/24.
//

import Foundation
import UIKit


class RecentSearchWordCell : UITableViewCell {
    static let cellId = "recentsearchwordcellId"
    
    private let keyWordLabel : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textColor = .systemBlue
        lb.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        lb.text = "text"
        return lb
    }()
    
    private let seperator : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension RecentSearchWordCell {
    private func setLayout(){
        contentView.addSubview(keyWordLabel)
        contentView.addSubview(seperator)
        
        NSLayoutConstraint.activate([
            keyWordLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            keyWordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            keyWordLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            
            seperator.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            seperator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20),
            seperator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -20),
            seperator.heightAnchor.constraint(equalToConstant: 1),
            
            contentView.bottomAnchor.constraint(equalTo: keyWordLabel.bottomAnchor,constant : 10)
        ])
    }
}
