//
//  AppRootBuilder.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs

protocol AppRootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class AppRootComponent: Component<AppRootDependency>,
                              TodayDependency,
                              GameDependency,
                              AppDependency,
                              ArcadeDependency,
                              SearchDependency {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol AppRootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class AppRootBuilder: Builder<AppRootDependency>, AppRootBuildable {

    override init(dependency: AppRootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = AppRootComponent(dependency: dependency)
        let viewController = AppRootTabbarViewController()
        let interactor = AppRootInteractor(presenter: viewController)
        
        let todayBuilder = TodayBuilder(dependency: component)
        let gameBuilder = GameBuilder(dependency: component)
        let appBuilder = AppBuilder(dependency: component)
        let arcadeBuilder = ArcadeBuilder(dependency: component)
        let searchBuilder = SearchBuilder(dependency: component)
       
        return AppRootRouter(interactor: interactor,
                             viewController: viewController,
                             today: todayBuilder,
                             game: gameBuilder,
                             app: appBuilder,
                             arcade: arcadeBuilder,
                             search: searchBuilder)
    }
}
