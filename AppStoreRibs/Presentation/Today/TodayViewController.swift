//
//  TodayViewController.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import ModernRIBs
import UIKit

protocol TodayPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class TodayViewController: UIViewController, TodayPresentable, TodayViewControllable {

    weak var listener: TodayPresentableListener?
    
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
extension TodayViewController {
    private func setLayout() {
        let tabItem = UITabBarItem(title: "투데이", image: UIImage(systemName: "doc.text.image"), tag: 0)
        self.tabBarItem = tabItem
    }
}
