//
//  ForYouViewController.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import UIKit


class ForYouViewController: UIViewController {

    @IBOutlet weak var filtersCollectionView: UICollectionView!
    @IBOutlet weak var postsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var presenter: ForYouViewToPresenterProtocol?
    
    let filters = Filters.allCases.map { $0.description }
    let filtersIDs = Filters.allCases.map { $0.rawValue }
    var posts = [Post]()
    var selectedFilterPosition = 0
    var selectedCategory = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFiltersCollectionView()
        setupPostsTableView()
        
        hideTableView()
        presenter?.startFetchingPosts(of: selectedCategory)

    }
    
    private func setupFiltersCollectionView() {
        filtersCollectionView.register(UINib(nibName: FiltersCollectionViewCell.IDENTIFIER, bundle: nil), forCellWithReuseIdentifier: FiltersCollectionViewCell.IDENTIFIER)
        filtersCollectionView.dataSource = self
        filtersCollectionView.delegate = self
    }
    
    
    private func setupPostsTableView() {
        postsTableView.register(UINib(nibName: PostTableViewCell.IDENTIFIER, bundle: nil), forCellReuseIdentifier: PostTableViewCell.IDENTIFIER)
        postsTableView.dataSource = self
        postsTableView.delegate = self
    }
    
    private func hideTableView() {
        postsTableView.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    private func showTableView() {
        postsTableView.isHidden = false
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        postsTableView.reloadData()
        postsTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
}

extension ForYouViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiltersCollectionViewCell.IDENTIFIER, for: indexPath) as! FiltersCollectionViewCell
        cell.setup(with: filters[indexPath.item])
        if (selectedFilterPosition == indexPath.item) {
            cell.selectFilter()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedFilterPosition = indexPath.item
        selectedCategory = filtersIDs[indexPath.item]
        presenter?.startFetchingPosts(of: selectedCategory)
        collectionView.reloadData()
        hideTableView()
    }
}

extension ForYouViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.IDENTIFIER, for: indexPath) as! PostTableViewCell
        cell.setup(with: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let sceneDelegate = view.window?.windowScene?.delegate as? SceneDelegate {
            sceneDelegate.customNavBar?.navigate()
            presenter?.showPostDetailsViewController(navigationController: self.navigationController!, navBar: sceneDelegate.customNavBar!)
        }
    }
    
}

extension ForYouViewController: ForYouPresenterToViewProtocol {
    func showPosts(posts: [Post]) {
        self.posts = posts
        showTableView()
    }
    
    func showError() {
        print("Error")
    }
}
