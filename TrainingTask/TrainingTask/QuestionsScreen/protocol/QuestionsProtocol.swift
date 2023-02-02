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
}

protocol QuestionsPresenterToViewProtocol: AnyObject {
    func showFilters(filters: [String])
    func hideCollectionView()
    func showUsers(users: [User])
    func showError()
}

protocol QuestionsPresenterToInteractorProtocol: AnyObject {
    func fetchUsers(of category: Int, at filterPosition: Int)
}

protocol QuestionsInteractorToPresenterProtocol: AnyObject {
    func usersFetchingSucceeded(users: [User], at filterPosition: Int)
    func usersFetchingFailed()
}
