//
//  PostProtocol.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import Foundation
import UIKit

protocol ForYouViewToPresenterProtocol: AnyObject {
    var view: ForYouPresenterToViewProtocol? { get set }
    var interactor: ForYouPresenterToInteractorProtocol? { get set }
    var router: ForYouPresenterToRouterProtocol? { get set }
    
    func startFetchingPosts(atPosition position: Int)
    func hidePostsTable()
    func showPostsTable()
    func showPostDetailsViewController(navigationController: UINavigationController)
}

protocol ForYouPresenterToViewProtocol: AnyObject {
    func hidePostsTable()
    func showPostsTable()
    func showPosts(posts: [Post])
    func showError()
}

protocol ForYouPresenterToRouterProtocol {
    static func createForYouScreen() -> ForYouViewController
    func navigateToPostDetailsScreen(navigationController: UINavigationController)
}

protocol ForYouPresenterToInteractorProtocol: AnyObject {
    var presenter: ForYouInteractorToPresenterProtocol? { get set }
    func fetchPosts(of category: Int)
}

protocol ForYouInteractorToPresenterProtocol: AnyObject {
    func postsFetchingSuccess(posts: [Post])
    func postsFetchingFailure()
}
