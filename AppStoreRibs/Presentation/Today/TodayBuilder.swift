//
//  TodayBuilder.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs

protocol TodayDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class TodayComponent: Component<TodayDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol TodayBuildable: Buildable {
    func build(withListener listener: TodayListener) -> TodayRouting
}

final class TodayBuilder: Builder<TodayDependency>, TodayBuildable {

    override init(dependency: TodayDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TodayListener) -> TodayRouting {
        let component = TodayComponent(dependency: dependency)
        let viewController = TodayViewController()
        let interactor = TodayInteractor(presenter: viewController)
        interactor.listener = listener
        return TodayRouter(interactor: interactor, viewController: viewController)
    }
}
