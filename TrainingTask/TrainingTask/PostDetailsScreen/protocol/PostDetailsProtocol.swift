//
//  PostDetailsProtocol.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/30/23.
//

import Foundation

protocol PostDetailsViewToPresenterProtocol: AnyObject {
    func viewDidLoad()
}

protocol PostDetailsPresenterToViewProtocol: AnyObject {
    func setupViews(with post: Post)
}
