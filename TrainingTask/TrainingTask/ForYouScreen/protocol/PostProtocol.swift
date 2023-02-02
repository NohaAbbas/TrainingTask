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
    func hidePostsTable()
    func showPostDetailsViewController(postAt postPosition: Int, filter filterPosition: Int)
}

protocol ForYouPresenterToViewProtocol: AnyObject {
    func hidePostsTable()
    func showPosts(posts: [Post])
    func showFilters(filters: [String])
    func showError()
}

protocol ForYouPresenterToRouterProtocol {
    func navigateToPostDetailsScreen(post: Post)
}

protocol ForYouPresenterToInteractorProtocol: AnyObject {
    var presenter: ForYouInteractorToPresenterProtocol? { get set }
    func fetchPosts(of category: Int, filter filterPosition: Int)
}

protocol ForYouInteractorToPresenterProtocol: AnyObject {
    func postsFetchingSuccess(posts: [Post], of filter: Int)
    func postsFetchingFailure()
}
