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
    
    static let IDENTIFIER = "ForYouViewController"
    
    var filteredPostsList = [FilteredPosts]()
    var selectedFilterPosition = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for filter in Filters.allCases {
            filteredPostsList.append(FilteredPosts(filterName: filter.description, posts: []))
        }
        
        setupFiltersCollectionView()
        setupPostsTableView()
        presenter?.startFetchingPosts(atPosition: selectedFilterPosition)

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
        filteredPostsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiltersCollectionViewCell.IDENTIFIER, for: indexPath) as! FiltersCollectionViewCell
        cell.setup(with: filteredPostsList[indexPath.item].filterName, at: indexPath.item, lastSelected: selectedFilterPosition)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedFilterPosition = indexPath.item
        if filteredPostsList[selectedFilterPosition].posts.isEmpty {
            presenter?.startFetchingPosts(atPosition: selectedFilterPosition)
        } else {
            presenter?.showPostsTable()
        }
        
        collectionView.reloadData()
        
    }
}

extension ForYouViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredPostsList[selectedFilterPosition].posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.IDENTIFIER, for: indexPath) as! PostTableViewCell
        let postsList = filteredPostsList[selectedFilterPosition].posts
        cell.setup(with: postsList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showPostDetailsViewController(navigationController: self.navigationController!, post: filteredPostsList[selectedFilterPosition].posts[indexPath.row])
    }
    
}

extension ForYouViewController: ForYouPresenterToViewProtocol {
    func hidePostsTable() {
        hideTableView()
    }
    
    func showPostsTable() {
        showTableView()
    }
    
    func showPosts(posts: [Post]) {
        filteredPostsList[selectedFilterPosition].posts = posts
        presenter?.showPostsTable()
    }
    
    func showError() {
        print("Error")
    }
}
