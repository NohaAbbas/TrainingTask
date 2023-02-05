//
//  UsersCollectionViewCell.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/1/23.
//

import UIKit
import SDWebImage

class UsersCollectionViewCell: UICollectionViewCell {
    static let IDENTIFIER = "UsersCollectionViewCell"
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        layer.cornerRadius = 0
        backgroundColor = UIColor.clear
    }
    
    func setupCell(at position: Int, with user: User) {
        let cellType: Int = position % 6
        let type = CellType(rawValue: cellType)
        type?.configureCell(forView: self)
        
        userNameLabel.text = user.name
        userImage.sd_setImage(with: URL(string: user.imageUrl.avatarSize48Url))
        descriptionLabel.text = user.description
        
    }

}

