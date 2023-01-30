//
//  PostDetailsViewController.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/29/23.
//

import UIKit
import SDWebImage

class PostDetailsViewController: UIViewController {
    static let IDENTIFIER = "PostDetailsViewController"

    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!

    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var webViewHeightConstraint: NSLayoutConstraint!
    
    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        setupViews()
    }
    
    private func setupWebView() {
        webView.scrollView.isScrollEnabled = false
        webView.delegate = self
        
    }
    
    private func setupViews() {
        guard let post else { return }
        postTitleLabel.text = post.title.titleString
        authorNameLabel.text = post.embedded.author[0].name
        authorImage.sd_setImage(with: URL(string: post.embedded.author[0].avatar.AvatarSize24Url)) { img, error, _, url in
            if let error {
                print("error in image: error \(error)\nurl: \(url)")
            }
        }
        postImage.sd_setImage(with: URL(string: post.embedded.featuredMedia[0].imageUrl)) { img, error, _, url in
            if let error {
                print("error in image: error \(error)\nurl: \(url)")
            }
        }
        webView.loadHTMLString(post.content.article, baseURL: nil)
    }

}

extension PostDetailsViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        webViewHeightConstraint.constant = webView.scrollView.contentSize.height
        view.layoutSubviews()
    }

}
