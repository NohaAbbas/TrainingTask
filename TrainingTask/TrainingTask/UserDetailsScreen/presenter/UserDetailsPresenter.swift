//
//  UserDetailsPresenter.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/5/23.
//

import Foundation

class UserDetailsPresenter: UserDetailsViewToPresenterProtocol {
    
    weak var view: UserDetailsPresenterToViewProtocol?
    var user: User?
    
    func viewDidLoad() {
        guard let user else { return }
        view?.setupViews(with: user)
    }
    
}
