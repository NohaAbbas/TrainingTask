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
    
    let filtersIDs = Filters.allCases.map { $0.rawValue }
    var filteredUsers = [FilteredUsers]()
    let ALL_FILTER_POSITION = 0
    
    init() {
        for filter in Filters.allCases {
            filteredUsers.append(FilteredUsers(filterName: filter.description, users: []))
        }
    }
    
    func viewDidLoad() {
        view?.showFilters(filters: filteredUsers.map{ $0.filterName })
        startFetchingUsers(of: ALL_FILTER_POSITION)
    }
    
    func startFetchingUsers(of category: Int) {
        if !filteredUsers[category].users.isEmpty {
            view?.showUsers(users: filteredUsers[category].users)
            return
        }
        view?.hideCollectionView()
        interactor?.fetchUsers(of: filtersIDs[category], at: category)
    }
    
}

extension QuestionsPresenter: QuestionsInteractorToPresenterProtocol {
    func usersFetchingSucceeded(users: [User], at filterPosition: Int) {
        filteredUsers[filterPosition].users = users
        view?.showUsers(users: users)
    }
    
    func usersFetchingFailed() {
        view?.showError()
    }
    
}
