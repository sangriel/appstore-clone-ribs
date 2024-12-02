//
//  SearchListBuilder.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/30/24.
//
import ModernRIBs
import Combine

protocol SearchListDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class SearchListComponent: Component<SearchListDependency> {
    
}

// MARK: - Builder
protocol SearchListBuildable: Buildable {
    func build(withListener listener: SearchListListener) -> SearchListRouting
}

final class SearchListBuilder: Builder<SearchListDependency>, SearchListBuildable {

    override init(dependency: SearchListDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SearchListListener) -> SearchListRouting {
        let component = SearchListComponent(dependency: dependency)
        let viewController = SearchListViewController()
        let tableView = viewController.tableView
        let interactor = SearchListInteractor(presenter: viewController,
                                              recentSearchWordTableViewAdapter: RecentSearchWordTableViewAdapterImp(tableView: tableView),
                                              matchSearchWordTableViewAdapater: MatchSearchWordTableViewAdapterImp(tableView: tableView),
                                              searchResultTableViewAdapater: SearchResultTableViewAdapterImp(tableView: tableView))
        interactor.listener = listener
        return SearchListRouter(interactor: interactor, viewController: viewController)
    }
}
