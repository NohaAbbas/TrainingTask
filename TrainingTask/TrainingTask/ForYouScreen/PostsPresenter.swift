//
//  PostsPresenter.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import UIKit


class PostsPresenter : ForYouViewToPresenterProtocol {
    weak var view: ForYouPresenterToViewProtocol?
    var interactor: ForYouPresenterToInteractorProtocol?
    var router: ForYouPresenterToRouterProtocol?
    
    let filtersIDs = Filters.allCases.map { $0.rawValue }
    
    func startFetchingPosts(atPosition position: Int) {
        hidePostsTable()
        interactor?.fetchPosts(of: filtersIDs[position])
    }
    
    func showPostDetailsViewController(navigationController: UINavigationController) {
        router?.navigateToPostDetailsScreen(navigationController: navigationController)
    }
    
}

extension PostsPresenter: ForYouInteractorToPresenterProtocol {
    func postsFetchingSuccess(posts: [Post]) {
        view?.showPosts(posts: posts)
    }
    
    func postsFetchingFailure() {
        view?.showError()
    }
    
    func hidePostsTable() {
        view?.hidePostsTable()
    }
    
    func showPostsTable() {
        view?.showPostsTable()
    }
    
}
