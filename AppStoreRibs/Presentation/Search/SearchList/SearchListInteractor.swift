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
}

protocol SearchListListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class SearchListInteractor: PresentableInteractor<SearchListPresentable>, SearchListInteractable, SearchListPresentableListener {

    weak var router: SearchListRouting?
    weak var listener: SearchListListener?
    
    private weak var recentSearchWordTableViewAdapter: RecentSearchWordTableViewAdapter?
    
    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(presenter: SearchListPresentable,
         recentSearchWordTableViewAdapter: RecentSearchWordTableViewAdapter) {
        super.init(presenter: presenter)
        presenter.listener = self
        self.recentSearchWordTableViewAdapter = recentSearchWordTableViewAdapter
        self.recentSearchWordTableViewAdapter?.delegate = self
        self.recentSearchWordTableViewAdapter?.dataSource = self
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
extension SearchListInteractor : RecentSearchWordTableViewAdapterDataSource, RecentSearchWordTableViewViewAdapterDelegate {
    var numberOfItems: Int {
        //TODO: 나중에 repository에서 바로 끌어오는 식으로
        return 0
    }
    
}
