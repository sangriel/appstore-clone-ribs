//
//  SearchBarBuilder.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/29/24.
//

import ModernRIBs

protocol SearchBarDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class SearchBarComponent: Component<SearchBarDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol SearchBarBuildable: Buildable {
    func build(withListener listener: SearchBarListener) -> SearchBarRouting
}

final class SearchBarBuilder: Builder<SearchBarDependency>, SearchBarBuildable {

    override init(dependency: SearchBarDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: SearchBarListener) -> SearchBarRouting {
        let component = SearchBarComponent(dependency: dependency)
        let viewController = SearchBarViewController()
        let interactor = SearchBarInteractor(presenter: viewController)
        interactor.listener = listener
        return SearchBarRouter(interactor: interactor, viewController: viewController)
    }
}
