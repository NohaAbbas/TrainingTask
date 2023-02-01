//
//  QuestionsInteractor.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/1/23.
//

import Foundation

class QuestionsInteractor: QuestionsPresenterToInteractorProtocol {
    weak var presenter: QuestionsInteractorToPresenterProtocol?
    
    func fetchUsers(of category: Int) {
        var url = USERS_URL
        if category != 0 {
            url.append("?categories=\(category)")
        }
        
        NetworkUtils.getFromAPI(urlString: url, decodable: [User].self) { [weak self] result, error in
            if let result {
                self?.presenter?.usersFetchingSucceeded(users: result)
            } else {
                self?.presenter?.usersFetchingFailed()
            }
        }
    }
    
}
