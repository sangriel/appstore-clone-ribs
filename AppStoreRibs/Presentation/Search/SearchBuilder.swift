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

    let searchUseCase: SearchUseCase
    let recentSearchWordUseCase : RecentSearchWordUseCase
    
    init(dependency : SearchDependency,
         searchUseCase : SearchUseCase,
         recentSearWordUseCase : RecentSearchWordUseCase) {
        self.searchUseCase = searchUseCase
        self.recentSearchWordUseCase = recentSearWordUseCase
        super.init(dependency: dependency)
    }
}

// MARK: - Builder

protocol SearchBuildable: Buildable {
    func build(withListener listener: SearchListener,searchUseCase : SearchUseCase,recentSearchWordUseCase : RecentSearchWordUseCase) -> SearchRouting
}

final class SearchBuilder: Builder<SearchDependency>, SearchBuildable {

    override init(dependency: SearchDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SearchListener,searchUseCase : SearchUseCase,recentSearchWordUseCase : RecentSearchWordUseCase) -> SearchRouting {
        let component = SearchComponent(dependency: dependency,
                                        searchUseCase: searchUseCase,
                                        recentSearWordUseCase : recentSearchWordUseCase)
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
