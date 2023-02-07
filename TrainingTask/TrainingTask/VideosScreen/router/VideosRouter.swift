//
//  VideosRouter.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/7/23.
//

import Foundation
import UIKit

class VideosRouter {
    
    var navigationController: UINavigationController?
    
    static func createVideosScreen(with navigationController: UINavigationController) -> VideosViewController {
        
        let view = VideosViewController(nibName: VideosViewController.IDENTIFIER, bundle: .main)
        view.tabBarItem.image = UIImage(systemName: "video.fill")
        view.tabBarItem.title = "Videos"
        
        let presenter = VideosPresenter()
        let interactor = VideosInteractor()
        let router = VideosRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        router.navigationController = navigationController
        
        return view
    }
    
}

extension VideosRouter: VideosPresenterToRouterProtocol {
    
    func showErrorAlert(error: String) {
        navigationController?.present(
            UIHelper.showErrorAlert(withTitle: Constants.ERROR_TITLE, andMessage: error),
            animated: true)
    }
    
}
