//
//  QuestionsPresenter.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/1/23.
//

import Foundation
import UIKit

class QuestionsPresenter: QuestionsViewToPresenterProtocol {
    weak var view: QuestionsPresenterToViewProtocol?
    var interactor: QuestionsPresenterToInteractorProtocol?
    var router: QuestionsPresenterToRouterProtocol?
    
    let filtersIDs = Filters.allCases.map { $0.rawValue }
    var filteredUsers = [FilteredUsers]()
    
    init() {
        for filter in Filters.allCases {
            filteredUsers.append(FilteredUsers(filterName: filter.description, users: []))
        }
    }
    
    func viewDidLoad() {
        startFetchingUsers(of: Filters.ALL.rawValue)
    }
    
    func startFetchingUsers(of category: Int) {
        if !filteredUsers[category].users.isEmpty {
            view?.showUsers(users: filteredUsers[category].users)
            return
        }
        view?.hideCollectionView()
        interactor?.fetchUsers(of: filtersIDs[category], at: category)
    }
    
    func showAlert(error: String, view: QuestionsPresenterToViewProtocol) {
        router?.showAlert(error: error, view: view)
    }
    
    func showUserDetailsScreen(userAt userPosition: Int, withFilter filterPosition: Int) {
        router?.navigateToUserDetailsScreen(user: filteredUsers[filterPosition].users[userPosition])
    }
    
}

extension QuestionsPresenter: QuestionsInteractorToPresenterProtocol {
    func usersFetchingSucceeded(users: [User], at filterPosition: Int) {
        filteredUsers[filterPosition].users = users
        view?.showUsers(users: users)
    }
    
    func usersFetchingFailed(error: String) {
        view?.showError(error: error)
    }
    
}
