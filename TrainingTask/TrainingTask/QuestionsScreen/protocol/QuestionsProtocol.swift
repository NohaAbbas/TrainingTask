//
//  QuestionsProtocol.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/1/23.
//

import Foundation

protocol QuestionsViewToPresenterProtocol : AnyObject {
    func viewDidLoad()
    func startFetchingUsers(of category: Int)
    func showUserDetailsScreen(userAt userPosition: Int, withFilter filterPosition: Int)
}

protocol QuestionsPresenterToViewProtocol: AnyObject {
    func hideCollectionView()
    func showFilters(filters: [String])
    func showUsers(users: [User])
    func hideLoading()
}

protocol QuestionsPresenterToInteractorProtocol: AnyObject {
    func fetchUsers(of category: Int, at filterPosition: Int)
}

protocol QuestionsInteractorToPresenterProtocol: AnyObject {
    func usersFetchingSucceeded(users: [User], at filterPosition: Int)
    func usersFetchingFailed(error: String)
}

protocol QuestionsPresenterToRouterProtocol {
    func showAlert(error: String)
    func navigateToUserDetailsScreen(user: User)
}
