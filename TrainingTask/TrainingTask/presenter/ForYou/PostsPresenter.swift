//
//  PostsPresenter.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import UIKit


class PostsPresenter : ForYouViewToPresenterProtocol {
    var view: ForYouPresenterToViewProtocol?
    var interactor: ForYouPresenterToInteractorProtocol?
    var router: ForYouPresenterToRouterProtocol?
    
    func startFetchingPosts(of category: Int) {
        interactor?.fetchPosts(of: category)
    }
    
    func showPostDetailsViewController(navigationController: UINavigationController, navBar: CustomNavigationBar) {
        router?.navigateToPostDetailsScreen(navigationController: navigationController, navBar: navBar)
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
