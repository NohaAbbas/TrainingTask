//
//  PostDetailsProtocol.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/30/23.
//

import Foundation

protocol PostDetailsViewToPresenterProtocol: AnyObject {
    func getPostContent(content: String, date: String)
}

protocol PostDetailsPresenterToRouterProtocol: AnyObject {
    static func createPostDetailsScreen() -> PostDetailsViewController
}
