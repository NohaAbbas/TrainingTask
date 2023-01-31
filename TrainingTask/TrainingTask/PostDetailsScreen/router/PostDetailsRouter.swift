//
//  PostDetailsRouter.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/30/23.
//

import Foundation

class PostDetailsRouter {
    func createPostDetailsScreen(with post: Post) -> PostDetailsViewController {
        let view = PostDetailsViewController(nibName: PostDetailsViewController.IDENTIFIER, bundle: Bundle.main)
        
        let presenter = PostDetailsPresenter(post: post)
        
        return view
    }
    
}
