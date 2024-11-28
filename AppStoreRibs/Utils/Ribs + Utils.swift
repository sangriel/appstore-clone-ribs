//
//  Ribs + Utils.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//
import UIKit
import ModernRIBs

final class NavigationControllable : ViewControllable {
    var uiviewController: UIViewController {
        self.navigationController
    }
    
    let navigationController : UINavigationController
    
    init(root : ViewControllable) {
        let navigation = UINavigationController(rootViewController: root.uiviewController)
        navigation.navigationBar.isTranslucent = false
        navigation.navigationBar.backgroundColor = .white
        navigation.navigationBar.scrollEdgeAppearance = navigation.navigationBar.standardAppearance
        
        self.navigationController = navigation
    }
    
}
