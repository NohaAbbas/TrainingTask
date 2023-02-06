//
//  ForYouViewController.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import UIKit


class ForYouViewController: UIViewController {
    static let IDENTIFIER = "ForYouViewController"

    @IBOutlet weak var filtersCollectionView: FiltersCollectionView!
    @IBOutlet weak var postsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: ForYouViewToPresenterProtocol?
    var posts = [Post]()
    var selectedFilterPosition = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupPostsTableView()
        presenter?.viewDidLoad()
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
        presenter?.showPostDetailsViewController(postAt: indexPath.row, filter: selectedFilterPosition)
    }
    
}

extension ForYouViewController: ForYouPresenterToViewProtocol {
    func hidePostsTable() {
        hideTableView()
    }
    
    func showFilters(filters: [String]) {
        filtersCollectionView.configure(withArray: filters)
        filtersCollectionView.filtersDelegate = self
    }
    
    func showPosts(posts: [Post]) {
        self.posts = posts
        showTableView()
    }
    
    func showError(error: String) {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        presenter?.showAlert(error: error, view: self)
    }
}

extension ForYouViewController: FiltersCollectionViewProtocol {
    func filterCellClicked(selectedFilterPosition: Int) {
        self.selectedFilterPosition = selectedFilterPosition
        presenter?.startFetchingPosts(atPosition: selectedFilterPosition)
    }
}

