//
//  NavBarProtocol.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/31/23.
//

import UIKit

protocol NavBarViewToPresenterProtocol: AnyObject {
    var view: NavBarPresenterToViewProtocol? { get set }
    
    func handleNavBar(with viewController: UIViewController)
    func onBackClicked()
}

protocol NavBarPresenterToViewProtocol: AnyObject {
    func navigate()
    func backFromNavigation()
}
