//
//  UIHelper.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/5/23.
//

import Foundation
import UIKit


class UIHelper {
    static func showErrorAlert(withTitle title: String, andMessage msg: String) -> UIAlertController{
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        return alert
    }
}
