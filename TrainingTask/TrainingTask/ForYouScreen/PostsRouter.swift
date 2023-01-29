//
//  PostsRouter.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import Foundation
import UIKit

class PostsRouter : ForYouPresenterToRouterProtocol {
    static func createForYouScreen() -> ForYouViewController{
        let view = ForYouViewController(nibName: "ForYouViewController", bundle: Bundle.main)
        view.tabBarItem.title = "For You"
        view.tabBarItem.image = UIImage(systemName: "book.fill")
        
        let presenter = PostsPresenter()
        let interactor = PostsInteractor()
        let router = PostsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
    
    func navigateToPostDetailsScreen(navigationController: UINavigationController) {
        let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: PostDetailsViewController.IDENTIFIER) as! PostDetailsViewController
        navigationController.pushViewController(view, animated: true)
    }
    
}
