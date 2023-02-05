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
    
    static func roundTopLeftAndBottomRightCorners(view: UIView) {
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    static func roundTopRightAndBottomRightCorners(view: UIView) {
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    }
    
    static func roundTopRightAndBottomLeftCorners(view: UIView) {
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMaxYCorner]
    }
}
