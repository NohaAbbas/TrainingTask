//
//  PostsInteractor.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import Foundation
import Alamofire

class PostsInteractor: ForYouPresenterToInteractorProtocol {
    var presenter: ForYouInteractorToPresenterProtocol?
    
    func fetchPosts(of category: Int) {
        var urlString = POSTS_URL
        if category != 0 {
            urlString.append("&categories=\(category)")
        }
        AF.request(urlString).responseDecodable(of: [Post].self) { result in
            if let response = result.value {
                print("response \(response)")
                self.presenter?.postsFetchingSuccess(posts: response)
            } else {
                print("error occured: \(result.error?.localizedDescription)")
                self.presenter?.postsFetchingFailure()
            }
        }
    }
    
}
