//
//  PostDetailsViewController.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/29/23.
//

import UIKit

class PostDetailsViewController: UIViewController {
    var customNavBar: CustomNavigationBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customNavBar?.navBarDelegate = self
    }

}

extension PostDetailsViewController: CustomNavBarDelegate {
    func didClickBack() {
        customNavBar?.backFromNavigation()
        self.navigationController?.popViewController(animated: true)
    }
}
