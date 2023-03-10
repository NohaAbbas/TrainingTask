//
//  CustomNavigationBar.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/24/23.
//

import UIKit

class CustomNavigationBar: UIView {
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    var presenter: NavBarViewToPresenterProtocol?
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addElevation()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        let view = Bundle.main.loadNibNamed("CustomNavigationBar", owner: self)?.first as? UIView
        view?.frame = bounds
        addSubview(view!)
        addElevation()
    }
    
    @IBAction func onBackButtonClcik(_ sender: UIButton) {
        presenter?.onBackClicked()
    }
    
    func addElevation() {
        layer.masksToBounds = false
        layer.shadowRadius = 2
        layer.shadowOpacity = 2
        layer.shadowColor = UIColor.gray.cgColor
    }
    
}

extension CustomNavigationBar: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        presenter?.handleNavBar(with: viewController)
    }
}

extension CustomNavigationBar: NavBarPresenterToViewProtocol {
    func navigate() {
        backButton.isHidden = false
        menuButton.isHidden = true
    }
    
    func backFromNavigation() {
        backButton.isHidden = true
        menuButton.isHidden = false
    }
}
