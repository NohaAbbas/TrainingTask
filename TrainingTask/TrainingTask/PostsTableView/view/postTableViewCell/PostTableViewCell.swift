//
//  PostTableViewCell.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import UIKit
import SDWebImage

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    
    static let IDENTIFIER = "PostTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with post: Post) {
        let imageLink = getImageLink(post: post)
        setTitleLabelStyle(post: post)
        postTitle.text = post.title.titleString
        postImage.sd_setImage(with: URL(string: imageLink))
    }
    
    private func getImageLink(post: Post) -> String {
        var imageLink = ""
        if post.format == "video" {
            var videoLinkName = post.content.article.slice(from: "https://www.youtube.com/watch?v=", to: "&")
            if videoLinkName?.isEmpty ?? true {
                videoLinkName = post.content.article.slice(from: "https://youtu.be/", to: "&")
            }
            imageLink = "https://img.youtube.com/vi/\(videoLinkName ?? "")/hqdefault.jpg"
        } else {
            imageLink = post.embedded.featuredMedia?[0].imageUrl ?? ""
        }
        return imageLink
    }
    
    private func setTitleLabelStyle(post: Post) {
        if post.format == "video" {
            postTitle.textColor = UIColor(red: 82/255, green: 95/255, blue: 132/255, alpha: 1)
            postTitle.font = .systemFont(ofSize: 15, weight: .medium)
            
        } else {
            postTitle.textColor = .darkGray
            postTitle.font = .boldSystemFont(ofSize: 17)
        }
    }
}
