//
//  PostDetailsProtocol.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/30/23.
//

import Foundation

protocol PostDetailsPresenterToRouterProtocol: AnyObject {
    static func createPostDetailsScreen() -> PostDetailsViewController
}
