//
//  PostProtocol.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import Foundation
import UIKit

protocol ForYouViewToPresenterProtocol: AnyObject {
    func viewDidLoad()
    func startFetchingPosts(atPosition position: Int)
    func showPostDetailsViewController(postAt postPosition: Int, filter filterPosition: Int)
}

protocol ForYouPresenterToViewProtocol: AnyObject {
    func hidePostsTable()
    func showFilters(filters: [String])
    func showPosts(posts: [Post])
    func hideLoading()
}

protocol ForYouPresenterToRouterProtocol {
    func navigateToPostDetailsScreen(post: Post)
    func showAlertWithErrorMessage(error: String)
}

protocol ForYouPresenterToInteractorProtocol: AnyObject {
    func fetchPosts(of category: Int, filter filterPosition: Int)
}

protocol ForYouInteractorToPresenterProtocol: AnyObject {
    func postsFetchingSuccess(posts: [Post], of filter: Int)
    func postsFetchingFailure(error: String)
}
