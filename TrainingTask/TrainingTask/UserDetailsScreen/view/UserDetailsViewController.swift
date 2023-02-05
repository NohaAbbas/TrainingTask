//
//  UserDetailsViewController.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/5/23.
//

import UIKit
import SDWebImage

class UserDetailsViewController: UIViewController {

    static let IDENTIFIER = "UserDetailsViewController"
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userDescriptionLabel: UILabel!
    @IBOutlet weak var askUserButton: UIButton!
    
    var presenter: UserDetailsViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }

}

extension UserDetailsViewController: UserDetailsPresenterToViewProtocol {
    
    func setupViews(with user: User) {
        userImage.sd_setImage(with: URL(string: user.imageUrl.avatarSize96Url))
        userNameLabel.text = user.name
        userDescriptionLabel.text = user.description
        askUserButton.setTitle("Ask \(user.name)", for: .normal)
    }
    
}
