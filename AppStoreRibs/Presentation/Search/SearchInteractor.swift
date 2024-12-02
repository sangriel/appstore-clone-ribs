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

protocol SearchInteractorDependency : AnyObject {
    var searchUseCase : SearchUseCase { get }
}

final class SearchInteractor: PresentableInteractor<SearchPresentable>, SearchInteractable, SearchPresentableListener {
 
    weak var router: SearchRouting?
    weak var listener: SearchListener?

    private let dependency : SearchInteractorDependency
    
    private var _currentSearchStateSubject : CurrentValuePublisher<SearchBarInteractor.SearchState> = .init(initialValue: .onEmpty)
    private var _reloadSearchListDataSubject : PassthroughSubject<Void,Never> = .init()
    private var _searchResults: [SearchResult] = []
    
    
    private var cancellables: Set<AnyCancellable> = .init()
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: SearchPresentable,
         dependency : SearchInteractorDependency) {
        self.dependency = dependency
        super.init(presenter: presenter)
        presenter.listener = self
        self.cancellables = .init()
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
//MARK: - SearchBarInteractor Listener
extension SearchInteractor {
    func searchStateDidChange(state: SearchBarInteractor.SearchState) {
        _currentSearchStateSubject.send(state)
    }
    
    func searchTextDidChange(text: String) {
        
    }
    
    func requestRemoteFetch(term: String) {
        dependency.searchUseCase.fetchRemote(term: term)
            .sink { error in
                if case let .failure(error) = error {
                    print(error)
                }
            } receiveValue: { [weak self] result in
                guard let self = self else { return }
                self._searchResults = result
                self._reloadSearchListDataSubject.send()
            }
            .store(in: &cancellables)
    }
}
//MARK: - SearchListInteractor Responder
extension SearchInteractor {
    var searchState: ReadOnlyCurrentValuePublisher<SearchBarInteractor.SearchState> {
        _currentSearchStateSubject
    }
    
    var reloadTableViewData: ReadOnlyPassthroughSubject<Void, Never> {
        .init(_reloadSearchListDataSubject)
    }
    
    var searchResults: [SearchResult] {
        _searchResults
    }
}

