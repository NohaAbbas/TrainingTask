//
//  VideosViewController.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/7/23.
//

import UIKit

class VideosViewController: UIViewController {
    
    static let IDENTIFIER = "VideosViewController"
    
    @IBOutlet weak var videosContainer: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var videosTableView: PostsTableView?
    var presenter: VideosViewToPresenterProtocol?

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
        videosTableView = PostsTableView(frame: CGRect(x: 0, y: 0, width: videosContainer.bounds.width, height: videosContainer.bounds.height), style: .plain)
        
        videosContainer.addSubview(videosTableView!)
    }
    
    private func showVideosTable() {
        videosContainer.isHidden = false
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
    }
    
    private func hideVideosTable() {
        videosContainer.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
    }
}

extension VideosViewController: VideosPresenterToViewProtocol {
    func showVideos(videos: [Post]) {
        videosTableView?.configureWith(array: videos)
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
