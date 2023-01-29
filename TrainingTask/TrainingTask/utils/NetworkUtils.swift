//
//  NetworkUtils.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/29/23.
//

import Foundation
import Alamofire

class NetworkUtils {
    static func getFromAPI<T: Decodable> (urlString: String, decodable: T.Type, completionHandler: @escaping (T?, String?) -> Void ) {
        AF.request(urlString).responseDecodable(of: T.self) { result in
            if let response = result.value {
                print("response \(response)")
                completionHandler(response, nil)
            } else {
                print("error occured: \(result.error?.localizedDescription)")
                completionHandler(nil, result.error?.localizedDescription)
            }
        }
    }
}
