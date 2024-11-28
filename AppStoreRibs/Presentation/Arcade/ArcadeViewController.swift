//
//  ArcadeViewController.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs
import UIKit

protocol ArcadePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class ArcadeViewController: UIViewController, ArcadePresentable, ArcadeViewControllable {

    weak var listener: ArcadePresentableListener?
    
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
extension ArcadeViewController {
    private func setLayout() {
        let tabItem = UITabBarItem(title: "Arcade", image: UIImage(named: "tabbar_arcade"), tag: 3)
        self.tabBarItem = tabItem
    }
}
