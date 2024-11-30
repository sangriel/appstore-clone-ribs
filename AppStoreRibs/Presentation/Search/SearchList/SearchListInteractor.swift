//
//  SearchListInteractor.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/30/24.
//

import ModernRIBs

protocol SearchListRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol SearchListPresentable: Presentable {
    var listener: SearchListPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
    func changeTableViewAdapater(_ adapter : any TableViewAdapter)
}

protocol SearchListListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
   
}


final class SearchListInteractor: PresentableInteractor<SearchListPresentable>, SearchListInteractable, SearchListPresentableListener {

    weak var router: SearchListRouting?
    weak var listener: SearchListListener?
    
    private var recentSearchWordTableViewAdapter: (any RecentSearchWordTableViewAdapter)?
    private var matchSearchWordTableViewAdapter: (any MatchSearchWordTableViewAdapter)?
    
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: SearchListPresentable,
         recentSearchWordTableViewAdapter: any RecentSearchWordTableViewAdapter,
         matchSearchWordTableViewAdapater : any MatchSearchWordTableViewAdapter) {
        super.init(presenter: presenter)
        presenter.listener = self
        self.recentSearchWordTableViewAdapter = recentSearchWordTableViewAdapter
        self.recentSearchWordTableViewAdapter?.delegate = self
        self.recentSearchWordTableViewAdapter?.dataSource = self
        self.matchSearchWordTableViewAdapter = matchSearchWordTableViewAdapater
        self.matchSearchWordTableViewAdapter?.delegate = self
        self.matchSearchWordTableViewAdapter?.dataSource = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
        if let recentSearchWordTableViewAdapter = recentSearchWordTableViewAdapter {
            presenter.changeTableViewAdapater(recentSearchWordTableViewAdapter)
        }
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
extension SearchListInteractor : RecentSearchWordTableViewAdapterDataSource, RecentSearchWordTableViewViewAdapterDelegate {
    var numberOfItems: Int {
        //TODO: 나중에 repository에서 바로 끌어오는 식으로
        return 10
    }
}
extension SearchListInteractor : MatchSearchWordTableViewDataSource, MatchSearchWordTableViewAdapterDelegate {
    
}
