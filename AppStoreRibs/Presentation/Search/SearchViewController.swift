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
    
    func recentTempBtnTapped()
    func matchTempBtnTapped()
}

final class SearchViewController: UIViewController, SearchPresentable, SearchViewControllable {
    

    weak var listener: SearchPresentableListener?
    
    var recentTempBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("recent", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    var matchTempBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("match", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    var stack = UIStackView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.setNavigationBar()
        self.setLayout()
        
        recentTempBtn.addTarget(self, action: #selector(recentTempBtnTapped), for: .touchUpInside)
        matchTempBtn.addTarget(self, action: #selector(matchTempBtnTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc
    private func recentTempBtnTapped() {
        self.listener?.recentTempBtnTapped()
    }
    
    @objc
    private func matchTempBtnTapped() {
        self.listener?.matchTempBtnTapped()
    }
    
}
extension SearchViewController {
    
    private func setNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationItem.title = "검색"
        
        let tabItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 4)
        self.tabBarItem = tabItem
    }
    
    private func setLayout() {
        stack.addArrangedSubview(recentTempBtn)
        stack.addArrangedSubview(matchTempBtn)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 10
        self.view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            stack.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setListTableView(_ viewController: any ViewControllable) {
        let vc = viewController.uiviewController
        addChild(vc)

        self.view.addSubview(vc.view)
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vc.view.topAnchor.constraint(equalTo: stack.bottomAnchor),
            vc.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            vc.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            vc.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
            
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
