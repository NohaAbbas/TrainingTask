//
//  PostDetailsRouter.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/30/23.
//

import Foundation

class PostDetailsRouter: PostDetailsPresenterToRouterProtocol {
    static func createPostDetailsScreen() -> PostDetailsViewController {
        let view = PostDetailsViewController(nibName: PostDetailsViewController.IDENTIFIER, bundle: Bundle.main)
        
        return view
    }
    
}
