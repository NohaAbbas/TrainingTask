//
//  VideosRouter.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/7/23.
//

import Foundation
import UIKit

class VideosRouter {
    
    static func createVideosScreen() -> VideosViewController {
        
        let view = VideosViewController(nibName: VideosViewController.IDENTIFIER, bundle: .main)
        view.tabBarItem.image = UIImage(systemName: "video.fill")
        view.tabBarItem.title = "Videos"
        
        var presenter = VideosPresenter()
        var interactor = VideosInteractor()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
}
