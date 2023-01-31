//
//  PostsRouter.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import Foundation
import UIKit

class PostsRouter : ForYouPresenterToRouterProtocol {
    var navigationController: UINavigationController?
    
    static func createForYouScreen(with navigationController: UINavigationController) -> ForYouViewController{
        let view = ForYouViewController(nibName: ForYouViewController.IDENTIFIER, bundle: Bundle.main)
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
        
        router.navigationController = navigationController
        
        return view
    }
    
    func navigateToPostDetailsScreen(post: Post) {
        let postDetailsVC = PostDetailsRouter().createPostDetailsScreen(with: post)
        navigationController?.pushViewController(postDetailsVC, animated: true)
    }
    
}
