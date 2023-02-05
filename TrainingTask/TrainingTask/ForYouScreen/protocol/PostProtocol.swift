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
    func showAlert(error: String, view: ForYouPresenterToViewProtocol)
}

protocol ForYouPresenterToViewProtocol: AnyObject {
    func hidePostsTable()
    func showPosts(posts: [Post])
    func showError(error: String)
}

protocol ForYouPresenterToRouterProtocol {
    func navigateToPostDetailsScreen(post: Post)
    func showAlertWithErrorMessage(error: String, view: ForYouPresenterToViewProtocol)
}

protocol ForYouPresenterToInteractorProtocol: AnyObject {
    var presenter: ForYouInteractorToPresenterProtocol? { get set }
    func fetchPosts(of category: Int, filter filterPosition: Int)
}

protocol ForYouInteractorToPresenterProtocol: AnyObject {
    func postsFetchingSuccess(posts: [Post], of filter: Int)
    func postsFetchingFailure(error: String)
}
