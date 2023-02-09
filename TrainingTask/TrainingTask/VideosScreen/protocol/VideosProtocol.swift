//
//  VideosProtocol.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/7/23.
//

import Foundation


protocol VideosViewToPresenterProtocol: AnyObject {
    func viewDidLoad()
}

protocol VideosPresenterToViewProtocol: AnyObject {
    func showVideos(videos: [Post])
    func hideLoading()
    func hideTable()
}

protocol VideosPresenterToInteractorProtocol: AnyObject {
    func fetchVideos()
}

protocol VideosInteractorToPresenterProtocol: AnyObject {
    func videosFetchingSuccess(videos: [Post])
    func videosFetchingFailure(error: String)
}

protocol VideosPresenterToRouterProtocol: AnyObject {
    func showErrorAlert(error: String)
}
