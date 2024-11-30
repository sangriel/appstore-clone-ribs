//
//  SearchRouter.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs

protocol SearchInteractable: Interactable,
                             SearchListListener {
    var router: SearchRouting? { get set }
    var listener: SearchListener? { get set }
}

protocol SearchViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func setListTableView(_ viewController : ViewControllable)
}

final class SearchRouter: ViewableRouter<SearchInteractable, SearchViewControllable>, SearchRouting {

    private let searchListBuildable : SearchListBuildable
    private var searchListRouting : Routing?
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: SearchInteractable,
         viewController: SearchViewControllable,
         searchListBuildable : SearchListBuildable
    ) {
        self.searchListBuildable = searchListBuildable
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
}
extension SearchRouter {
    func attachSearchList() {
        if searchListRouting != nil { return }
        
        let routing = searchListBuildable.build(withListener: interactor)
        self.searchListRouting = routing
        self.viewController.setListTableView(routing.viewControllable)
        attachChild(routing)
    }
}
