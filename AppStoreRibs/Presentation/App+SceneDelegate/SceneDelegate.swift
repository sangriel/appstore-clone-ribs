//
//  SceneDelegate.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/24/24.
//

import UIKit
import ModernRIBs

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var launchRouter : LaunchRouting?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        let launchRouter = AppRootBuilder(dependency: AppLaunchComponent()).build()
        self.launchRouter = launchRouter
        
        launchRouter.launch(from: window!)
    }
}

