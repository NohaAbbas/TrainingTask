//
//  QuestionsInteractor.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/1/23.
//

import Foundation

class QuestionsInteractor: QuestionsPresenterToInteractorProtocol {
    weak var presenter: QuestionsInteractorToPresenterProtocol?
    
    func fetchUsers(of category: Int, at filterPosition: Int) {
        var url = Constants.USERS_URL
        if category != Filters.ALL.rawValue {
            url.append("?categories=\(category)")
        }
        
        NetworkUtils.getFromAPI(urlString: url, decodable: [User].self) { [weak self] result, error in
            if let result {
                self?.presenter?.usersFetchingSucceeded(users: result, at: filterPosition)
            } else {
                self?.presenter?.usersFetchingFailed(error: error ?? Constants.USERS_FETCHING_ERROR_MSG)
            }
        }
    }
    
}
