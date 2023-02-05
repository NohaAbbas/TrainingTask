//
//  UserDetailsRouter.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/5/23.
//

import Foundation

class UserDetailsRouter {
    
    func createUserDetailsScreen(withUser user: User) -> UserDetailsViewController {
        let view = UserDetailsViewController(nibName: UserDetailsViewController.IDENTIFIER, bundle: .main)
        
        let presenter = UserDetailsPresenter()
        
        presenter.view = view
        presenter.user = user
        
        view.presenter = presenter
        
        return view
    }
    
}
