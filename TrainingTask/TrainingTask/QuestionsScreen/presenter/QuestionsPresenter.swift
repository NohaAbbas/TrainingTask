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
    
    var filteredUsers = [FilteredUsers]()
    var selectedCategory = 0
    
    init() {
        for filter in Filters.allCases {
            filteredUsers.append(FilteredUsers(filterName: filter.description, users: []))
        }
    }
    
    func viewDidLoad() {
        view?.showFilters(filters: filteredUsers.map{ $0.filterName })
        startFetchingUsers(of: selectedCategory)
    }
    
    func startFetchingUsers(of category: Int) {
        selectedCategory = category

        if !filteredUsers[selectedCategory].users.isEmpty {
            view?.showUsers(users: filteredUsers[selectedCategory].users)
            return
        }
        view?.hideCollectionView()
        interactor?.fetchUsers(of: selectedCategory)
    }
    
}

extension QuestionsPresenter: QuestionsInteractorToPresenterProtocol {
    func usersFetchingSucceeded(users: [User]) {
        filteredUsers[selectedCategory].users = users
        view?.showUsers(users: users)
    }
    
    func usersFetchingFailed() {
        view?.showError()
    }
    
}
