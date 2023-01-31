//
//  PostDetailsPresenter.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/31/23.
//

import Foundation

class PostDetailsPresenter: PostDetailsViewToPresenterProtocol {
    
    weak var view: PostDetailsPresenterToViewProtocol?
    var post: Post?
    
    func viewDidLoad() {
        guard let post else { return }
        view?.setupViews(with: post)
    }

}
