//
//  SearchRouter.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs

protocol SearchInteractable: Interactable, SearchBarListener {
    var router: SearchRouting? { get set }
    var listener: SearchListener? { get set }
}

protocol SearchViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func attachSearchBarController(searchController : ViewControllable)
}

final class SearchRouter: ViewableRouter<SearchInteractable, SearchViewControllable>, SearchRouting {
   
    private let searchBarBuilder : SearchBarBuildable
    private var searchBarRouting : Routing?

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: SearchInteractable,
                  viewController: SearchViewControllable,
                  searchBarBuilder: SearchBarBuildable) {
        self.searchBarBuilder = searchBarBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
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
