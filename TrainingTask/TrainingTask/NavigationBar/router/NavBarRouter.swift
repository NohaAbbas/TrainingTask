//
//  NavBarRouter.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/31/23.
//

import UIKit

class NavBarRouter: NavBarPresenterToRouterProtocol {
    var navigationController: UINavigationController?
    
    static func addCustomNavBar(with navigationController: UINavigationController) -> CustomNavigationBar {
        let customNavBar = CustomNavigationBar(frame: CGRect(x: 0, y: (navigationController.navigationBar.frame.height) + 20, width: UIScreen.main.bounds.width, height: 40))
        
        let presenter = NavBarPresenter()
        let router = NavBarRouter()
        
        customNavBar.presenter = presenter

        presenter.view = customNavBar
        presenter.router = router
        
        router.navigationController = navigationController
        router.navigationController?.delegate = customNavBar
        
        customNavBar.translatesAutoresizingMaskIntoConstraints = false
        navigationController.view.addSubview(customNavBar)
        
        setNavBarConstraints(customNavBar, navigationController)
        
        return customNavBar
    }
    
    private static func setNavBarConstraints(_ customNavBar: CustomNavigationBar, _ navigationController: UINavigationController) {
        NSLayoutConstraint.activate([
            customNavBar.leadingAnchor.constraint(equalTo: navigationController.view!.leadingAnchor),
            customNavBar.trailingAnchor.constraint(equalTo: navigationController.view!.trailingAnchor),
            customNavBar.topAnchor.constraint(equalTo: navigationController.view!.topAnchor),
            customNavBar.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func navigateToPreviousScreen() {
        navigationController?.popViewController(animated: true)
    }
}
