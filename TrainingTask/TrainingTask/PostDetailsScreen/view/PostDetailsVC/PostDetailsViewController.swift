//
//  PostDetailsViewController.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/29/23.
//

import UIKit
import WebKit
import SDWebImage

class PostDetailsViewController: UIViewController {
    static let IDENTIFIER = "PostDetailsViewController"

    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postDate: UILabel!
    
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var authorNameLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var webViewHeightConstraint: NSLayoutConstraint!
    
    var presenter: PostDetailsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        presenter?.viewDidLoad()
    }
    
    private func setupWebView() {
        webView.scrollView.isScrollEnabled = false
        webView.navigationDelegate = self
    }

}

extension PostDetailsViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if webView.isLoading == false {
            
            self.webView.evaluateJavaScript("document.readyState") { complete, error in
                if complete != nil {
                    self.webView.evaluateJavaScript("document.body.offsetHeight"){ (height, error) in
                        self.webViewHeightConstraint.constant += height as! CGFloat
                        webView.sizeToFit()
                    }
                }
            }
        }
    }
    
}

extension PostDetailsViewController: PostDetailsPresenterToViewProtocol {
    func setupViews(with post: Post) {
        let headerString = "<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></header>"
        postTitleLabel.text = post.title.titleString
        tagLabel.text = post.categories.first?.name.uppercased()
        postDate.text = post.formattedDate
        authorNameLabel.text = post.embedded.author[0].name
        authorImage.sd_setImage(with: URL(string: post.embedded.author.first?.avatar.AvatarSize24Url ?? ""))
        postImage.sd_setImage(with: URL(string: post.embedded.featuredMedia.first?.imageUrl ?? ""))
        webView.loadHTMLString(headerString + post.content.article, baseURL: nil)
    }
}
