//
//  UserDetailsProtocol.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/5/23.
//

import Foundation


protocol UserDetailsViewToPresenterProtocol: AnyObject {
    func viewDidLoad()
}

protocol UserDetailsPresenterToViewProtocol: AnyObject {
    func setupViews(with user: User)
}
