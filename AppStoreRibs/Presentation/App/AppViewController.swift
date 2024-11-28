//
//  AppViewController.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs
import UIKit

protocol AppPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class AppViewController: UIViewController, AppPresentable, AppViewControllable {

    weak var listener: AppPresentableListener?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension AppViewController {
    private func setLayout() {
        self.title = "App"
        let tabItem = UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.3d.up.fill"),tag: 2)
        self.tabBarItem = tabItem
    }
}
