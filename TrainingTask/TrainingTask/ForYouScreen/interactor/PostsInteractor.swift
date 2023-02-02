//
//  PostsInteractor.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import Foundation
import Alamofire

class PostsInteractor: ForYouPresenterToInteractorProtocol {
    weak var presenter: ForYouInteractorToPresenterProtocol?
    let ALL_FILTER_POSITION = 0
    
    func fetchPosts(of category: Int, filter filterPosition : Int) {
        var urlString = POSTS_URL
        if category != ALL_FILTER_POSITION {
            urlString.append("&categories=\(category)")
        }
        
        NetworkUtils.getFromAPI(urlString: urlString, decodable: [Post].self) { result, error in
            if let result {
                self.presenter?.postsFetchingSuccess(posts: result, of: filterPosition)
            } else {
                self.presenter?.postsFetchingFailure()
            }
        }
    }
    
}
