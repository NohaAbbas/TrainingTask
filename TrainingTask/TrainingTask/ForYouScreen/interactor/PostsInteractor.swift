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
    
    func fetchPosts(of category: Int, filter filterPosition : Int) {
        var urlString = Constants.POSTS_URL
        if category != Filters.ALL.rawValue {
            urlString.append("&categories=\(category)")
        }
        
        NetworkUtils.getFromAPI(urlString: urlString, decodable: [Post].self) { result, error in
            if let result {
                self.presenter?.postsFetchingSuccess(posts: result, of: filterPosition)
            } else {
                self.presenter?.postsFetchingFailure(error: error ?? Constants.POSTS_FETCHING_ERROR_MSG)
            }
        }
    }
    
}
