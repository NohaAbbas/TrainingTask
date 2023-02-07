//
//  VideosInteractor.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/7/23.
//

import Foundation

class VideosInteractor : VideosPresenterToInteractorProtocol{

    weak var presenter: VideosInteractorToPresenterProtocol?
    
    func fetchVideos() {
        var url = Constants.POSTS_URL + "&categories=\(Constants.VIDEOS_CATEGORY)"
        NetworkUtils.getFromAPI(urlString: url, decodable: [Post].self) { videos, error in
            if let videos {
                self.presenter?.videosFetchingSuccess(videos: videos)
            } else {
                self.presenter?.videosFetchingFailure(error: error ?? Constants.VIDEOS_FETCHING_ERROR_MSG)
            }
        }
    }
    
}
