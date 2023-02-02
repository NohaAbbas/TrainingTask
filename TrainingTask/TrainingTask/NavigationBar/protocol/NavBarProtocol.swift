//
//  NavBarProtocol.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/31/23.
//

import UIKit

protocol NavBarViewToPresenterProtocol: AnyObject {    
    func handleNavBar(with viewController: UIViewController)
    func onBackClicked()
}

protocol NavBarPresenterToViewProtocol: AnyObject {
    func navigate()
    func backFromNavigation()
}

protocol NavBarPresenterToRouterProtocol: AnyObject {
    func navigateToPreviousScreen()
}
