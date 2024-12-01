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
    var currentSearchStateSubject : PassthroughSubject<SearchBarInteractor.SearchState,Never> { get }
    var searchUseCase : SearchUseCase { get }
}

final class SearchInteractor: PresentableInteractor<SearchPresentable>, SearchInteractable, SearchPresentableListener {
    
    weak var router: SearchRouting?
    weak var listener: SearchListener?

    private let dependency: SearchInteractorDependency
    
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
        dependency.currentSearchStateSubject.send(state)
    }
    
    func searchTextDidChange(text: String) {
        
    }
    
    func requestRemoteFetch(term: String) {
        dependency.searchUseCase.fetchRemote(term: term)
            .sink { error in
                if case let .failure(error) = error {
                    print(error)
                }
            } receiveValue: { result in
                print(result)
            }
            .store(in: &cancellables)
    }
}
