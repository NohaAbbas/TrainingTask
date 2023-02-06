//
//  PostsPresenter.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import UIKit


class PostsPresenter {
    
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
    
}

extension PostsPresenter: ForYouViewToPresenterProtocol {
    func viewDidLoad() {
        startFetchingPosts(atPosition: Filters.ALL.rawValue)
        prepareFiltersList()
    }
    
    func prepareFiltersList() {
        let filters = Filters.allCases.map {$0.description}
        view?.showFilters(filters: filters)
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
    
    func showAlert(error: String) {
        router?.showAlertWithErrorMessage(error: error)
    }
}

extension PostsPresenter: ForYouInteractorToPresenterProtocol {
    
    func postsFetchingSuccess(posts: [Post], of filter: Int) {
        filteredPostsList[filter].posts = posts
        view?.showPosts(posts: posts)
    }
    
    func postsFetchingFailure(error: String) {
        view?.showError()
        showAlert(error: error)
    }
    
}
