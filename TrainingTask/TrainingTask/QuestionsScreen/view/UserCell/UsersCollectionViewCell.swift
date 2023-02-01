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
    
    func roundTopLeftAndBottomRightCorners() {
        clipsToBounds = true
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    func roundTopRightAndBottomRightCorners() {
        clipsToBounds = true
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    func roundTopRightAndBottomLeftCorners() {
        clipsToBounds = true
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
    }
    
    func setupCell(at position: Int, with user: User) {
        let cellType: Int = position % 6
        let type = CellType(rawValue: cellType)
        
        switch type {
        case .First:
            roundTopLeftAndBottomRightCorners()
            backgroundColor = UIColor(red: 194/255, green: 242/255, blue: 236/255, alpha: 1)
        case .Second:
            backgroundColor = UIColor(red: 255/255, green: 229/255, blue: 206/255, alpha: 1)
        case .Third:
            roundTopRightAndBottomRightCorners()
            backgroundColor = UIColor(red: 254/255, green: 237/255, blue: 242/255, alpha: 1)
        case .Forth:
            roundTopRightAndBottomLeftCorners()
            backgroundColor = UIColor(red: 240/255, green: 235/255, blue: 255/255, alpha: 1)
        case .Fifth:
            backgroundColor = UIColor(red: 255/255, green: 239/255, blue: 183/255, alpha: 1)
        case .Sixth:
            roundTopLeftAndBottomRightCorners()
            backgroundColor = UIColor(red: 228/255, green: 249/255, blue: 253/255, alpha: 1)
        case .none:
            break
        }
        
        userNameLabel.text = user.name
        userImage.sd_setImage(with: URL(string: user.imageUrl.avatarSize48Url))
        descriptionLabel.text = user.description
        
    }

}

enum CellType: Int {
    case First = 0
    case Second = 1
    case Third = 2
    case Forth = 3
    case Fifth = 4
    case Sixth = 5
}
