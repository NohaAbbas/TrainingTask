//
//  QuestionsProtocol.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/1/23.
//

import Foundation

protocol QuestionsViewToPresenterProtocol : AnyObject {
    var view: QuestionsPresenterToViewProtocol? { get set }
    var interactor: QuestionsPresenterToInteractorProtocol? { get set }
    
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
    var presenter: QuestionsInteractorToPresenterProtocol? { get set }
    func fetchUsers(of category: Int)
}

protocol QuestionsInteractorToPresenterProtocol: AnyObject {
    func usersFetchingSucceeded(users: [User])
    func usersFetchingFailed()
}
