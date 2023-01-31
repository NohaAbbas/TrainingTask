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
    
    func viewDidLoad()
    func startFetchingPosts(atPosition position: Int)
    func hidePostsTable()
    func showPostDetailsViewController(postAt position: Int)
}

protocol ForYouPresenterToViewProtocol: AnyObject {
    func hidePostsTable()
    func showPosts(posts: [Post])
    func showFilters(filters: [String])
    func showError()
}

protocol ForYouPresenterToRouterProtocol {
    var navigationController: UINavigationController? { get set }
    
    static func createForYouScreen(with navigationController: UINavigationController) -> ForYouViewController
    func navigateToPostDetailsScreen(post: Post)
}

protocol ForYouPresenterToInteractorProtocol: AnyObject {
    var presenter: ForYouInteractorToPresenterProtocol? { get set }
    func fetchPosts(of category: Int)
}

protocol ForYouInteractorToPresenterProtocol: AnyObject {
    func postsFetchingSuccess(posts: [Post])
    func postsFetchingFailure()
}
