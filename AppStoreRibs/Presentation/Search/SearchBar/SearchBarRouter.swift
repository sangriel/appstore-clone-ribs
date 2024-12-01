//
//  SearchBarRouter.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/29/24.
//

import ModernRIBs

protocol SearchBarInteractable: Interactable {
    var router: SearchBarRouting? { get set }
    var listener: SearchBarListener? { get set }
}

protocol SearchBarViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class SearchBarRouter: ViewableRouter<SearchBarInteractable, SearchBarViewControllable>, SearchBarRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: SearchBarInteractable, viewController: SearchBarViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
