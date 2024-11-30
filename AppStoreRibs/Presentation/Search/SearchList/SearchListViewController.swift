//
//  SearchListViewController.swift
//  AppStoreRibs
//
//  Created by sangmin han on 11/30/24.
//

import ModernRIBs
import UIKit

protocol SearchListPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class SearchListViewController: UIViewController, SearchListPresentable, SearchListViewControllable {

    weak var listener: SearchListPresentableListener?
}