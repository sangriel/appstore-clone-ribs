//
//  GameViewController.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs
import UIKit

protocol GamePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class GameViewController: UIViewController, GamePresentable, GameViewControllable {

    weak var listener: GamePresentableListener?
    
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
extension GameViewController {
    private func setLayout() {
        let tabItem = UITabBarItem(title: "게임", image: UIImage(named: "tabbar_game"), tag: 1)
        self.tabBarItem = tabItem
    }
}
