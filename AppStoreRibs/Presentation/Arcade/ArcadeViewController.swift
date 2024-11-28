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
}
