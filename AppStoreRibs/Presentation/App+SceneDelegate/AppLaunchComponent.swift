//
//  AppComponent.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/28/24.
//

import Foundation
import ModernRIBs





class AppLaunchComponent : Component<EmptyDependency>, AppRootDependency {
    
    init() {
        super.init(dependency : EmptyComponent())
    }
    
}