//
//  User.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/1/23.
//

import Foundation

struct User: Codable {
    var name: String
    var description: String
    var imageUrl: UserAvatars
    
    enum CodingKeys: String, CodingKey {
        case name
        case description
        case imageUrl = "avatar_urls"
    }
}

struct UserAvatars: Codable {
    var avatarSize24Url: String
    var avatarSize48Url: String
    
    enum CodingKeys: String, CodingKey {
        case avatarSize24Url = "24"
        case avatarSize48Url = "48"
    }
}
