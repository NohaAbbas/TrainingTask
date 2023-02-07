//
//  ForYouViewController.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import UIKit


class ForYouViewController: UIViewController {
    static let IDENTIFIER = "ForYouViewController"

    @IBOutlet weak var filtersContainer: UIView!
    @IBOutlet weak var postsContainer: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: ForYouViewToPresenterProtocol?
    var posts = [Post]()
    var selectedFilterPosition = 0
    
    var filtersCollectionView: FiltersCollectionView?
    var postsTableView: PostsTableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFiltersCollectionView()
        setupPostsTableView()
        presenter?.viewDidLoad()
    }

    private func setupFiltersCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 100, height: 88)
        layout.scrollDirection = .horizontal
        
        filtersCollectionView = FiltersCollectionView(frame: CGRect(x: 0, y: 0, width: filtersContainer.frame.width, height: 88), collectionViewLayout: layout)
        filtersCollectionView?.showsHorizontalScrollIndicator = false
        filtersCollectionView?.filtersDelegate = self
    
        filtersContainer.addSubview(filtersCollectionView!)
    }
    
    private func setupPostsTableView() {
        //let tabBarHeight = tabBarController?.tabBar.frame.size.height
        postsTableView = PostsTableView(frame: CGRect(x: 0, y: 0, width: postsContainer.frame.width, height: postsContainer.frame.height), style: .plain)
        postsTableView?.postsDelegate = self
        postsContainer.addSubview(postsTableView!)
    }
    
    private func hideTableView() {
        postsContainer.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
    
    private func showTableView() {
        postsContainer.isHidden = false
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
}

extension ForYouViewController: ForYouPresenterToViewProtocol {
    func hidePostsTable() {
        hideTableView()
    }
    
    func showFilters(filters: [String]) {
        filtersCollectionView?.configureWith(array: filters)
    }
    
    func showPosts(posts: [Post]) {
        self.posts = posts
        postsTableView?.configureWith(array: posts)
        showTableView()
    }
    
    func showError() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
}

extension ForYouViewController: FiltersCollectionViewProtocol {
    func filterCellClicked(selectedFilterPosition: Int) {
        self.selectedFilterPosition = selectedFilterPosition
        presenter?.startFetchingPosts(atPosition: selectedFilterPosition)
    }
}

extension ForYouViewController: PostTableViewProtocol {
    
    func postCellClicked(selectedPostPosition: Int) {
        presenter?.showPostDetailsViewController(postAt: selectedPostPosition, filter: selectedFilterPosition)
    }
    
}
