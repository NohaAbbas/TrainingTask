//
//  PostsRouter.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import Foundation
import UIKit

class PostsRouter : ForYouPresenterToRouterProtocol {
    static func createModule() -> UITabBarController {
        let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
        view.viewControllers = [createForYou()]
        return view
    }
    
    static func createForYou() -> ForYouViewController{
        let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ForYouViewController") as! ForYouViewController
        
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
    
}
