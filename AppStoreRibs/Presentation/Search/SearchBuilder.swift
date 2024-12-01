//
//  SearchBuilder.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs
import Combine

protocol SearchDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class SearchComponent: Component<SearchDependency>,
                             SearchBarDependency,
                             SearchInteractorDependency,
                             SearchListDependency {
    var currentSearchStateSubject : PassthroughSubject<SearchBarInteractor.SearchState,Never> = PassthroughSubject<SearchBarInteractor.SearchState, Never>()
    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol SearchBuildable: Buildable {
    func build(withListener listener: SearchListener) -> SearchRouting
}

final class SearchBuilder: Builder<SearchDependency>, SearchBuildable {

    override init(dependency: SearchDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SearchListener) -> SearchRouting {
        let component = SearchComponent(dependency: dependency)
        let viewController = SearchViewController()
        let interactor = SearchInteractor(presenter: viewController,
                                          dependency: component)
        interactor.listener = listener
        
        let searchListBuildable = SearchListBuilder(dependency: component)
        let searchBarBuilder = SearchBarBuilder(dependency: component)
       
        return SearchRouter(interactor: interactor,
                            viewController: viewController,
                            searchListBuildable: searchListBuildable,
                            searchBarBuilder: searchBarBuilder)
    }
}
