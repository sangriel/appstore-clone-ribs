//
//  AppBuilder.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs

protocol AppDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class AppComponent: Component<AppDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol AppBuildable: Buildable {
    func build(withListener listener: AppListener) -> AppRouting
}

final class AppBuilder: Builder<AppDependency>, AppBuildable {

    override init(dependency: AppDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: AppListener) -> AppRouting {
        let component = AppComponent(dependency: dependency)
        let viewController = AppViewController()
        let interactor = AppInteractor(presenter: viewController)
        interactor.listener = listener
        return AppRouter(interactor: interactor, viewController: viewController)
    }
}
