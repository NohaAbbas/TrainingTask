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
    
    func startFetchingPosts(of category: Int)
    func showPostDetailsViewController(navigationController: UINavigationController, navBar: CustomNavigationBar)
}

protocol ForYouPresenterToViewProtocol: AnyObject {
    func showPosts(posts: [Post])
    func showError()
}

protocol ForYouPresenterToRouterProtocol {
    static func createModule() -> UITabBarController
    static func createForYouScreen() -> ForYouViewController
    func navigateToPostDetailsScreen(navigationController navigationController: UINavigationController, navBar navBar: CustomNavigationBar)
}

protocol ForYouPresenterToInteractorProtocol: AnyObject {
    var presenter: ForYouInteractorToPresenterProtocol? { get set }
    func fetchPosts(of category: Int)
}

protocol ForYouInteractorToPresenterProtocol: AnyObject {
    func postsFetchingSuccess(posts: [Post])
    func postsFetchingFailure()
}
