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
        let imageLink = post.videoImageLink
        setTitleLabelStyle(post: post)
        postTitle.text = post.title.titleString
        postImage.sd_setImage(with: URL(string: imageLink ?? ""))
    }
    
    private func setTitleLabelStyle(post: Post) {
        if post.format == "video" {
            postTitle.textColor = UIColor(red: 82/255, green: 95/255, blue: 132/255, alpha: 1)
            postTitle.font = UIFont(name: "Gotham-Medium", size: 14)
            
        } else {
            postTitle.textColor = .darkGray
            postTitle.font = UIFont(name: "Gotham-Bold", size: 15)
        }
    }
}
