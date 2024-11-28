//
//  AppRootInteractor.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs

protocol AppRootRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
    func attachTabs()
}

protocol AppRootPresentable: Presentable {
    var listener: AppRootPresentableListener? { get set }
    func setInitialTabIndex(index : Int)
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol AppRootListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class AppRootInteractor: PresentableInteractor<AppRootPresentable>, AppRootInteractable, AppRootPresentableListener {

    weak var router: AppRootRouting?
    weak var listener: AppRootListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: AppRootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        router?.attachTabs()
        presenter.setInitialTabIndex(index: 0)
        
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
