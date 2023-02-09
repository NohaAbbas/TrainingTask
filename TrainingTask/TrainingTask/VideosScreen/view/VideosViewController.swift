//
//  VideosViewController.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/7/23.
//

import UIKit

class VideosViewController: UIViewController {
    
    static let IDENTIFIER = "VideosViewController"
    
    @IBOutlet weak var videosTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var presenter: VideosViewToPresenterProtocol?
    var videos = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVideosTable()
        presenter?.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.tintColor = UIColor(red: 85/255, green: 113/255, blue: 156/255, alpha: 1)
    }
    
    private func setupVideosTable() {
        videosTableView.register(UINib(nibName: PostTableViewCell.IDENTIFIER, bundle: nil), forCellReuseIdentifier: PostTableViewCell.IDENTIFIER)
        videosTableView.dataSource = self
    }
    
    private func showVideosTable() {
        videosTableView.reloadData()
        videosTableView.isHidden = false
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    private func hideVideosTable() {
        videosTableView.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
}

extension VideosViewController: VideosPresenterToViewProtocol {
    func showVideos(videos: [Post]) {
        self.videos = videos
        showVideosTable()
    }
    
    func showError() {
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    func hideTable() {
        hideVideosTable()
    }
    
}

extension VideosViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.IDENTIFIER, for: indexPath) as! PostTableViewCell
        cell.setup(with: videos[indexPath.row])
        return cell
    }

}
