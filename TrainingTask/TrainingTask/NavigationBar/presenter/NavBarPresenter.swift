//
//  NavBarPresenter.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/31/23.
//

import UIKit

class NavBarPresenter: NavBarViewToPresenterProtocol {
    weak var view: NavBarPresenterToViewProtocol?
    
    var navigationController: UINavigationController?
    
    func handleNavBar(with viewController: UIViewController) {
        switch viewController {
        case viewController as? UITabBarController:
            view?.backFromNavigation()
            navigationController?.popViewController(animated: true)
        default:
            view?.navigate()
        }
    }
    
    func onBackClicked() {
        navigationController?.popViewController(animated: true)
    }
}
