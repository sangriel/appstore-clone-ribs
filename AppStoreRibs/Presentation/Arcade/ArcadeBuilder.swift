//
//  ArcadeBuilder.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs

protocol ArcadeDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ArcadeComponent: Component<ArcadeDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol ArcadeBuildable: Buildable {
    func build(withListener listener: ArcadeListener) -> ArcadeRouting
}

final class ArcadeBuilder: Builder<ArcadeDependency>, ArcadeBuildable {

    override init(dependency: ArcadeDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ArcadeListener) -> ArcadeRouting {
        let component = ArcadeComponent(dependency: dependency)
        let viewController = ArcadeViewController()
        let interactor = ArcadeInteractor(presenter: viewController)
        interactor.listener = listener
        return ArcadeRouter(interactor: interactor, viewController: viewController)
    }
}
