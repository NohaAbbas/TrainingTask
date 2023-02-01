//
//  QuestionsViewController.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/1/23.
//

import UIKit

class QuestionsViewController: UIViewController {
    static let IDENTIFIER = "QuestionsViewController"

    @IBOutlet weak var filtersCollectionView: UICollectionView!
    @IBOutlet weak var usersCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var filters = [String]()
    var selectedFilterPosition = 0
    var users = [User]()
    var presenter: QuestionsViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
        
        setupFiltersCollectionView()
        setupUsersCollectionView()
    }
    
    private func setupFiltersCollectionView() {
        filtersCollectionView.register(UINib(nibName: FiltersCollectionViewCell.IDENTIFIER, bundle: nil), forCellWithReuseIdentifier: FiltersCollectionViewCell.IDENTIFIER)
        filtersCollectionView.dataSource = self
        filtersCollectionView.delegate = self
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
        switch collectionView {
        case filtersCollectionView :
            return filters.count
        default:
            return users.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case filtersCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiltersCollectionViewCell.IDENTIFIER, for: indexPath) as! FiltersCollectionViewCell
            cell.setup(with: filters[indexPath.item], at: indexPath.item, lastSelected: selectedFilterPosition)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UsersCollectionViewCell.IDENTIFIER, for: indexPath) as! UsersCollectionViewCell
        
            cell.setupCell(at: indexPath.item, with: users[indexPath.item])
            return cell
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case filtersCollectionView:
            selectedFilterPosition = indexPath.item
            presenter?.startFetchingUsers(of: selectedFilterPosition)
            filtersCollectionView.reloadData()
        default:
            break
            
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2 - 10, height: 220.0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }

}

extension QuestionsViewController: QuestionsPresenterToViewProtocol {
    
    func showFilters(filters: [String]) {
        self.filters = filters
        filtersCollectionView.reloadData()
    }
    
    func hideCollectionView(){
        hideUsersCollectionView()
    }
    
    func showUsers(users: [User]) {
        self.users = users
        showUsersCollectionView()
    }
    
    func showError() {
        print("Error fetching users")
    }
    
}
