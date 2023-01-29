//
//  ApplicationFlow.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/29/23.
//

import UIKit

class ApplicationFlow {
    static func createTabBarController() -> UITabBarController {
        let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
        view.viewControllers = [PostsRouter.createForYouScreen()]
        return view
    }
}
