//
//  VideosPresenter.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/7/23.
//

import Foundation


class VideosPresenter {
    
    weak var view: VideosPresenterToViewProtocol?
    var interactor: VideosPresenterToInteractorProtocol?
    var router: VideosPresenterToRouterProtocol?
    
}

extension VideosPresenter: VideosViewToPresenterProtocol {
    
    func viewDidLoad() {
        view?.hideTable()
        interactor?.fetchVideos()
    }
    
}

extension VideosPresenter: VideosInteractorToPresenterProtocol {
    
    func videosFetchingSuccess(videos: [Post]) {
        view?.showVideos(videos: videos)
    }
    
    func videosFetchingFailure(error: String) {
        view?.hideLoading()
        router?.showErrorAlert(error: error)
    }
}
