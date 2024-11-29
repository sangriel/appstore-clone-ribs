//
//  SearchBarInteractor.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/29/24.
//

import ModernRIBs

protocol SearchBarRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol SearchBarPresentable: Presentable {
    var listener: SearchBarPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SearchBarListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    func searchStateDidChange(state : SearchBarInteractor.SearchState )
    func searchTextDidChange(text : String)
}

final class SearchBarInteractor: PresentableInteractor<SearchBarPresentable>, SearchBarInteractable, SearchBarPresentableListener {
    
    enum SearchState {
        case onEmpty
        case onSearch
        case onComplete
    }

    weak var router: SearchBarRouting?
    weak var listener: SearchBarListener?
    
    private var currentState : SearchState = .onEmpty

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: SearchBarPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
extension SearchBarInteractor {
    func didChangeText(text: String) {
        self.currentState = .onSearch
        self.listener?.searchStateDidChange(state: .onSearch)
        self.listener?.searchTextDidChange(text: text)
    }
    
    func didBeginEditing() {
        
    }
    
    func didEndEditing() {
        
    }
    
    func searchButtonClicked() {
        self.currentState = .onComplete
        self.listener?.searchStateDidChange(state: .onComplete)
    }
    
    func cancelButtonClicked() {
        self.currentState = .onEmpty
        self.listener?.searchStateDidChange(state: .onEmpty)
    }
}
