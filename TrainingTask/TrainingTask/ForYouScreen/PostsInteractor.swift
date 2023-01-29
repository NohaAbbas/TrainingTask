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
    
    func fetchPosts(of category: Int) {
        var urlString = POSTS_URL
        if category != 0 {
            urlString.append("&categories=\(category)")
        }
        
        NetworkUtils.getFromAPI(urlString: urlString, decodable: [Post].self) { result, error in
            if let result {
                self.presenter?.postsFetchingSuccess(posts: result)
            } else {
                self.presenter?.postsFetchingFailure()
            }
        }
    }
    
}
