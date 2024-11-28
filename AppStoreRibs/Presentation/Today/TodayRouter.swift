//
//  TodayRouter.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs

protocol TodayInteractable: Interactable {
    var router: TodayRouting? { get set }
    var listener: TodayListener? { get set }
}

protocol TodayViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class TodayRouter: ViewableRouter<TodayInteractable, TodayViewControllable>, TodayRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: TodayInteractable, viewController: TodayViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
