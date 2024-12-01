//
//  SearchRouter.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs

protocol SearchInteractable: Interactable, SearchBarListener, SearchListListener{
    var router: SearchRouting? { get set }
    var listener: SearchListener? { get set }
}

protocol SearchViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func setListTableView(_ viewController : ViewControllable)
    func attachSearchBarController(searchController : ViewControllable)
}

final class SearchRouter: ViewableRouter<SearchInteractable, SearchViewControllable>, SearchRouting {
   
    private let searchBarBuilder : SearchBarBuildable
    private var searchBarRouting : Routing?

    private let searchListBuildable : SearchListBuildable
    private var searchListRouting : Routing?
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: SearchInteractable,
         viewController: SearchViewControllable,
         searchListBuildable : SearchListBuildable,
         searchBarBuilder: SearchBarBuildable) {
        self.searchListBuildable = searchListBuildable
        self.searchBarBuilder = searchBarBuilder
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
extension SearchRouter {
    func attachSearcBar() {
        if searchBarRouting != nil { return }
        let router = searchBarBuilder.build(withListener: interactor)
        let searchBarController = router.viewControllable
        self.searchBarRouting = router
        viewController.attachSearchBarController(searchController: searchBarController)
    }
}
