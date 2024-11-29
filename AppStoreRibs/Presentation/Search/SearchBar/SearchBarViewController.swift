//
//  SearchBarViewController.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/29/24.
//

import ModernRIBs
import UIKit
import Combine

protocol SearchBarPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
    
    func didChangeText( text: String)
    func didBeginEditing()
    func didEndEditing()
    func searchButtonClicked()
    func cancelButtonClicked()
}

final class SearchBarViewController: UISearchController, SearchBarPresentable, SearchBarViewControllable {
    
   
    weak var listener: SearchBarPresentableListener?
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        bindView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bindView() {
        self.searchBar.delegate = self
        
    }
}
extension SearchBarViewController : UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        listener?.didBeginEditing()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listener?.didChangeText(text: searchText)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        listener?.didEndEditing()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        listener?.searchButtonClicked()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        listener?.cancelButtonClicked()
    }
}
