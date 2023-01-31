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
    var selectedFilterPosition = 0
    
    init() {
        for filter in Filters.allCases {
            filteredPostsList.append(FilteredPosts(filterName: filter.description, posts: []))
        }
    }
    
    func viewDidLoad() {
        view?.showFilters(filters: filteredPostsList.map{ $0.filterName })
        startFetchingPosts(atPosition: selectedFilterPosition)
    }
    
    func startFetchingPosts(atPosition position: Int) {
        selectedFilterPosition = position
        if !filteredPostsList[position].posts.isEmpty {
            view?.showPosts(posts: filteredPostsList[position].posts)
            return
        }
        
        hidePostsTable()
        interactor?.fetchPosts(of: filtersIDs[position])
    }
    
    func showPostDetailsViewController(postAt position: Int) {
        router?.navigateToPostDetailsScreen(post: filteredPostsList[selectedFilterPosition].posts[position])
    }
    
}

extension PostsPresenter: ForYouInteractorToPresenterProtocol {
    func postsFetchingSuccess(posts: [Post]) {
        filteredPostsList[selectedFilterPosition].posts = posts
        view?.showPosts(posts: posts)
    }
    
    func postsFetchingFailure() {
        view?.showError()
    }
    
    func hidePostsTable() {
        view?.hidePostsTable()
    }

    
}
