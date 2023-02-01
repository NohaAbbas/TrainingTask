//
//  QuestionsRouter.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/1/23.
//

import Foundation
import UIKit

class QuestionsRouter {
    static func createQuestionsScreen() -> QuestionsViewController {
        let view = QuestionsViewController(nibName: QuestionsViewController.IDENTIFIER, bundle: Bundle.main)
        view.tabBarItem.title = "Questions"
        view.tabBarItem.image = UIImage(systemName: "message.fill")
        
        let presenter = QuestionsPresenter()
        let interactor = QuestionsInteractor()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
