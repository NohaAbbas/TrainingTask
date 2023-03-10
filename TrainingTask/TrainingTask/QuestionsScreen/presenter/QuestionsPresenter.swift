//
//  QuestionsPresenter.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/1/23.
//

import Foundation
import UIKit

class QuestionsPresenter {
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
    
    private func prepareFiltersList() {
        let filters = Filters.allCases.map {$0.description}
        view?.showFilters(filters: filters)
    }
    
}

extension QuestionsPresenter: QuestionsViewToPresenterProtocol {
    
    func viewDidLoad() {
        startFetchingUsers(of: Filters.ALL.rawValue)
        prepareFiltersList()
    }
    
    func startFetchingUsers(of category: Int) {
        if !filteredUsers[category].users.isEmpty {
            view?.showUsers(users: filteredUsers[category].users)
            return
        }
        view?.hideCollectionView()
        interactor?.fetchUsers(of: filtersIDs[category], at: category)
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
        view?.hideLoading()
        router?.showAlert(error: error)
    }
    
}
