//
//  QuestionsViewController.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/1/23.
//

import UIKit

class QuestionsViewController: UIViewController {
    static let IDENTIFIER = "QuestionsViewController"
    
    @IBOutlet weak var filtersCollectionView: FiltersCollectionView!
    @IBOutlet weak var usersCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var users = [User]()
    var selectedFilterPosition = 0
    var presenter: QuestionsViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
        setupUsersCollectionView()
    }
    
    private func setupUsersCollectionView() {
        usersCollectionView.register(UINib(nibName: UsersCollectionViewCell.IDENTIFIER, bundle: nil), forCellWithReuseIdentifier: UsersCollectionViewCell.IDENTIFIER)
        usersCollectionView.dataSource = self
        usersCollectionView.delegate = self
    }
    
    private func hideUsersCollectionView() {
        usersCollectionView.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    private func showUsersCollectionView() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        usersCollectionView.isHidden = false
        usersCollectionView.reloadData()
        usersCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
    }
}

extension QuestionsViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UsersCollectionViewCell.IDENTIFIER, for: indexPath) as! UsersCollectionViewCell
        
        cell.setupCell(at: indexPath.item, with: users[indexPath.item])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.showUserDetailsScreen(userAt: indexPath.item, withFilter: selectedFilterPosition)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2 - 10, height: 220.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }

}

extension QuestionsViewController: QuestionsPresenterToViewProtocol {
    
    func hideCollectionView(){
        hideUsersCollectionView()
    }

    func showFilters(filters: [String]) {
        filtersCollectionView.configure(withArray: filters)
        filtersCollectionView.filtersDelegate = self
    }
    
    func showUsers(users: [User]) {
        self.users = users
        showUsersCollectionView()
    }
    
    func showError(error: String) {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        presenter?.showAlert(error: error, view: self)
    }
    
}


extension QuestionsViewController: FiltersCollectionViewProtocol {
    func filterCellClicked(selectedFilterPosition: Int) {
        presenter?.startFetchingUsers(of: selectedFilterPosition)
        self.selectedFilterPosition = selectedFilterPosition
    }
}
