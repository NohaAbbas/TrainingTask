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
        postTitle.text = post.title.titleString
        postImage.sd_setImage(with: URL(string: post.embedded.featuredMedia[0].imageUrl)) { img, error, _, url in
            if let error {
                print("error in image: error \(error)\nurl: \(url)")
            }
        }
    }
    
}
