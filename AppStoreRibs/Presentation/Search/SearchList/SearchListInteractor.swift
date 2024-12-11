//
//  SearchListInteractor.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/30/24.
//

import ModernRIBs
import Combine
import Foundation

protocol SearchListRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol SearchListPresentable: Presentable {
    var listener: SearchListPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
    func changeTableViewAdapater(_ adapter : any TableViewAdapter)
    func reloadTableView()
}

protocol SearchListListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
    
    
    var searchResults : [SearchResult] { get }
    var recentSearchWords : [RecentSearchWord] { get }
    var searchState : ReadOnlyCurrentValuePublisher<SearchBarInteractor.SearchState> { get }
    var reloadTableViewData : ReadOnlyPassthroughSubject<Void, Never>  { get }
}

final class SearchListInteractor: PresentableInteractor<SearchListPresentable>, SearchListInteractable, SearchListPresentableListener {

    weak var router: SearchListRouting?
    weak var listener: SearchListListener?
    
    private var recentSearchWordTableViewAdapter: (any RecentSearchWordTableViewAdapter)?
    private var matchSearchWordTableViewAdapter: (any MatchSearchWordTableViewAdapter)?
    private var searchResultTableViewAdapater : (any SearchResultTableViewAdapter)?
    
    private var cancellables: Set<AnyCancellable> = .init()
    private var currentState : SearchBarInteractor.SearchState = .onEmpty
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: SearchListPresentable,
         recentSearchWordTableViewAdapter: any RecentSearchWordTableViewAdapter,
         matchSearchWordTableViewAdapater : any MatchSearchWordTableViewAdapter,
         searchResultTableViewAdapater : any SearchResultTableViewAdapter) {
        self.cancellables = .init()
        super.init(presenter: presenter)
        presenter.listener = self
        self.recentSearchWordTableViewAdapter = recentSearchWordTableViewAdapter
        self.recentSearchWordTableViewAdapter?.delegate = self
        self.recentSearchWordTableViewAdapter?.dataSource = self
        self.matchSearchWordTableViewAdapter = matchSearchWordTableViewAdapater
        self.matchSearchWordTableViewAdapter?.delegate = self
        self.matchSearchWordTableViewAdapter?.dataSource = self
        self.searchResultTableViewAdapater = searchResultTableViewAdapater
        self.searchResultTableViewAdapater?.delegate = self
        self.searchResultTableViewAdapater?.dataSource = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        if let recentSearchWordTableViewAdapter = recentSearchWordTableViewAdapter {
            presenter.changeTableViewAdapater(recentSearchWordTableViewAdapter)
        }
        bindDependencies()
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
extension SearchListInteractor {
    private func bindDependencies() {
        listener?.searchState
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] state in
                guard let self = self else { return }
                self.currentState = state
                if state == .onEmpty {
                    guard let adapter = recentSearchWordTableViewAdapter else { return }
                    self.presenter.changeTableViewAdapater(adapter)
                }
                else if state == .onSearch {
                    guard let adapter = matchSearchWordTableViewAdapter else { return }
                    self.presenter.changeTableViewAdapater(adapter)
                }
                else {
                    guard let adapter = searchResultTableViewAdapater else { return }
                    self.presenter.changeTableViewAdapater(adapter)
                }
            })
            .store(in: &cancellables)
        
        listener?.reloadTableViewData
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] _ in
                self?.presenter.reloadTableView()
            })
            .store(in: &cancellables)
    }
    
}
extension SearchListInteractor : RecentSearchWordTableViewAdapterDataSource, RecentSearchWordTableViewViewAdapterDelegate {
    var numberOfItems: Int {
        switch currentState {
        case .onComplete:
            return listener?.searchResults.count ?? 0
        case .onEmpty:
            return listener?.recentSearchWords.count ?? 0
        case .onSearch:
            return 0
        }
    }
    
    func getRecentSearchWord(at IndexPath: IndexPath) -> RecentSearchWord? {
        return listener?.recentSearchWords[safe : IndexPath.row]
    }
}
extension SearchListInteractor : MatchSearchWordTableViewDataSource, MatchSearchWordTableViewAdapterDelegate {
 
}
extension SearchListInteractor : SearchResultTableViewAdapterDataSource, SearchResultTableViewAdapterDelegate {
    
    func getSearchResult(at IndexPath: IndexPath) -> SearchResult? {
        return listener?.searchResults[safe : IndexPath.row]
    }
}
