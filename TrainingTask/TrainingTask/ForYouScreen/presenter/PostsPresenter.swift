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
    var filteredPostsList = [FilteredPosts]()
    
    init() {
        for filter in Filters.allCases {
            filteredPostsList.append(FilteredPosts(filterName: filter.description, posts: []))
        }
    }
    
    func viewDidLoad() {
        startFetchingPosts(atPosition: Filters.ALL.rawValue)
    }
    
    func startFetchingPosts(atPosition position: Int) {
        if !filteredPostsList[position].posts.isEmpty {
            view?.showPosts(posts: filteredPostsList[position].posts)
            return
        }
        
        hidePostsTable()
        interactor?.fetchPosts(of: filtersIDs[position], filter: position)
    }
    
    func showPostDetailsViewController(postAt postPosition: Int, filter filterPosition: Int) {
        router?.navigateToPostDetailsScreen(post: filteredPostsList[filterPosition].posts[postPosition])
    }
    
    func hidePostsTable() {
        view?.hidePostsTable()
    }
    
    func showAlert(error: String, view: ForYouPresenterToViewProtocol) {
        router?.showAlertWithErrorMessage(error: error, view: view)
    }
    
}

extension PostsPresenter: ForYouInteractorToPresenterProtocol {
    
    func postsFetchingSuccess(posts: [Post], of filter: Int) {
        filteredPostsList[filter].posts = posts
        view?.showPosts(posts: posts)
    }
    
    func postsFetchingFailure(error: String) {
        view?.showError(error: error)
    }
    
}
