//
//  AppRouter.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs

protocol AppInteractable: Interactable {
    var router: AppRouting? { get set }
    var listener: AppListener? { get set }
}

protocol AppViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AppRouter: ViewableRouter<AppInteractable, AppViewControllable>, AppRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: AppInteractable, viewController: AppViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
