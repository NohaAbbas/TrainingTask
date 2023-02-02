//
//  NavBarPresenter.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/31/23.
//

import UIKit

class NavBarPresenter: NavBarViewToPresenterProtocol {
    weak var view: NavBarPresenterToViewProtocol?
    var router: NavBarPresenterToRouterProtocol?
        
    func handleNavBar(with viewController: UIViewController) {
        switch viewController {
        case viewController as? UITabBarController:
            view?.backFromNavigation()
        default:
            view?.navigate()
        }
    }
    
    func onBackClicked() {
        router?.navigateToPreviousScreen()
    }
}
