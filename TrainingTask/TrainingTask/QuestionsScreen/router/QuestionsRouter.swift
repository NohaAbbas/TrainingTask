//
//  QuestionsRouter.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/1/23.
//

import Foundation
import UIKit

class QuestionsRouter: QuestionsPresenterToRouterProtocol {
    
    var navigationController: UINavigationController?
    
    static func createQuestionsScreen(with navigationController: UINavigationController) -> QuestionsViewController {
        let view = QuestionsViewController(nibName: QuestionsViewController.IDENTIFIER, bundle: Bundle.main)
        view.tabBarItem.title = "Questions"
        view.tabBarItem.image = UIImage(systemName: "message.fill")
        
        let presenter = QuestionsPresenter()
        let interactor = QuestionsInteractor()
        let router = QuestionsRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.navigationController = navigationController
        
        return view
    }
    
    func showAlert(error: String, view: QuestionsPresenterToViewProtocol) {
        let alert = UIHelper.showErrorAlert(withTitle: Constants.ERROR_TITLE, andMessage: error)
        (view as? QuestionsViewController)?.present(alert, animated: true, completion: nil)
    }
    
    func navigateToUserDetailsScreen(user: User) {
        navigationController?.pushViewController(
            UserDetailsRouter().createUserDetailsScreen(withUser: user),
            animated: true)
     }
}
