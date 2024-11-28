//
//  ArcadeRouter.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs

protocol ArcadeInteractable: Interactable {
    var router: ArcadeRouting? { get set }
    var listener: ArcadeListener? { get set }
}

protocol ArcadeViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class ArcadeRouter: ViewableRouter<ArcadeInteractable, ArcadeViewControllable>, ArcadeRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: ArcadeInteractable, viewController: ArcadeViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
