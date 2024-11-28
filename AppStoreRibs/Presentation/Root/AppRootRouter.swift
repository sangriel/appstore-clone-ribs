//
//  AppRootRouter.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs

protocol AppRootInteractable: Interactable,
                              TodayListener,
                              GameListener,
                              AppListener,
                              ArcadeListener,
                              SearchListener{
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
    func setViewController(_ viewControllers : [ViewControllable])
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting {

    private let today : TodayBuildable
    private let game : GameBuildable
    private let app : AppBuildable
    private let arcade : ArcadeBuildable
    private let search : SearchBuildable
    
    private var todayRouting : ViewableRouting?
    private var gameRouting : ViewableRouting?
    private var appRouting : ViewableRouting?
    private var arcadeRouting : ViewableRouting?
    private var searchRouting : ViewableRouting?
    
    
    
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: AppRootInteractable,
         viewController: AppRootViewControllable,
         today : TodayBuildable,
         game : GameBuildable,
         app : AppBuildable,
         arcade : ArcadeBuildable,
         search : SearchBuildable
    ) {
        self.today = today
        self.game = game
        self.app = app
        self.arcade = arcade
        self.search = search
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func attachTabs() {
        let todayRouting = today.build(withListener: interactor)
        let gameRouting = game.build(withListener: interactor)
        let appRouting = app.build(withListener: interactor)
        let arcadeRouting = arcade.build(withListener: interactor)
        let searchRouting = search.build(withListener: interactor)
        
        attachChild(todayRouting)
        attachChild(gameRouting)
        attachChild(appRouting)
        attachChild(arcadeRouting)
        attachChild(searchRouting)
        
        let viewControllers = [
            todayRouting.viewControllable,
            gameRouting.viewControllable,
            NavigationControllable(root: appRouting.viewControllable),
            arcadeRouting.viewControllable,
            searchRouting.viewControllable
        ]
        
        self.viewController.setViewController(viewControllers)
    }
}
