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
    let ALL_FILTER_POSITION = 0
    
    init() {
        for filter in Filters.allCases {
            filteredPostsList.append(FilteredPosts(filterName: filter.description, posts: []))
        }
    }
    
    func viewDidLoad() {
        startFetchingPosts(atPosition: ALL_FILTER_POSITION)
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
    
}

extension PostsPresenter: ForYouInteractorToPresenterProtocol {
    
    func postsFetchingSuccess(posts: [Post], of filter: Int) {
        filteredPostsList[filter].posts = posts
        view?.showPosts(posts: posts)
    }
    
    func postsFetchingFailure() {
        view?.showError()
    }
    
    func hidePostsTable() {
        view?.hidePostsTable()
    }
    
}
