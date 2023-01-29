//
//  PostsPresenter.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import Foundation


class PostsPresenter : ForYouViewToPresenterProtocol {
    var view: ForYouPresenterToViewProtocol?
    var interactor: ForYouPresenterToInteractorProtocol?
    var router: ForYouPresenterToRouterProtocol?
    
    func startFetchingPosts(of category: Int) {
        interactor?.fetchPosts(of: category)
    }
    
}

extension PostsPresenter: ForYouInteractorToPresenterProtocol {
    func postsFetchingSuccess(posts: [Post]) {
        view?.showPosts(posts: posts)
    }
    
    func postsFetchingFailure() {
        view?.showError()
    }
    
    
}
