//
//  AppRootViewController.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs
import UIKit

protocol AppRootPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class AppRootTabbarViewController: UITabBarController, AppRootPresentable, AppRootViewControllable {

    weak var listener: AppRootPresentableListener?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
    }
    
    func setViewController(_ viewControllers : [ViewControllable]) {
        super.setViewControllers(viewControllers.map(\.uiviewController), animated: false)
    }
    
    
}
//MARK: - Presentable
extension AppRootTabbarViewController {
    func setInitialTabIndex(index: Int) {
        self.selectedIndex = index
    }
}
