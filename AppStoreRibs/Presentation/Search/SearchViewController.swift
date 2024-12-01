//
//  SearchViewController.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs
import UIKit

protocol SearchPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class SearchViewController: UIViewController, SearchPresentable, SearchViewControllable {
    weak var listener: SearchPresentableListener?
   
    init() {
        super.init(nibName: nil, bundle: nil)
        self.setNavigationItem()
        self.setTabBarItem()
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SearchViewController {
    private func setNavigationItem() {
        self.navigationItem.title = "검색"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    private func setTabBarItem() {
        let tabItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 4)
        self.tabBarItem = tabItem
    }
    
    private func setLayout() {
        
    }
    
    func setListTableView(_ viewController: any ViewControllable) {
        let vc = viewController.uiviewController
        addChild(vc)

        self.view.addSubview(vc.view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vc.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            vc.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            vc.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            vc.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        vc.didMove(toParent: self)
    }
}
extension SearchViewController {
    func attachSearchBarController(searchController: any ModernRIBs.ViewControllable) {
        guard let searchController = searchController as? UISearchController else { return }
        self.navigationItem.searchController = searchController
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.placeholder = "게임, 앱, 스토리 등"
    }
}
