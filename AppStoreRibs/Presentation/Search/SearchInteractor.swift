//
//  SearchInteractor.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs
import Combine

protocol SearchRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func attachSearchList()
    func attachSearcBar()
}

protocol SearchPresentable: Presentable {
    var listener: SearchPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SearchListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

protocol SearchInteractorDependency {
    var changeTableViewAdapterToRecentSearchWordSubject : PassthroughSubject<Void,Never> { get }
    var changeTableViewAdapterToMatchSearchWordSubject : PassthroughSubject<Void,Never> { get }
}

final class SearchInteractor: PresentableInteractor<SearchPresentable>, SearchInteractable, SearchPresentableListener {
    
    weak var router: SearchRouting?
    weak var listener: SearchListener?

    private let dependency: SearchInteractorDependency
    
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: SearchPresentable,
                  dependency : SearchInteractorDependency) {
        self.dependency = dependency
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        router?.attachSearchList()
        router?.attachSearcBar()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
extension SearchInteractor {
    func recentTempBtnTapped() {
        dependency.changeTableViewAdapterToRecentSearchWordSubject.send()
    }
    
    func matchTempBtnTapped() {
        dependency.changeTableViewAdapterToMatchSearchWordSubject.send()
    }
}
//MARK: - Presentable Listener
extension SearchInteractor {
    func searchStateDidChange(state: SearchBarInteractor.SearchState) {
        print("state changed \(state)")
    }
    
    func searchTextDidChange(text: String) {
        print("textDidChange \(text)")
    }
}
