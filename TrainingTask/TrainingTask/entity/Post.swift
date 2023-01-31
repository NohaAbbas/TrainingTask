//
//  Post.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import Foundation


struct Post: Codable {
    var title: Title
    var content: Content
    var embedded: EmbeddedLinks
    var categories: [Category]
    var date: String
    var formattedDate: String? {
        getDateAsString(dateString: date)
    }
    
    enum CodingKeys: String, CodingKey {
        case title
        case content
        case embedded = "_embedded"
        case categories = "categories_labels"
        case date
    }
}

struct Title: Codable {
    var titleString: String

    enum CodingKeys: String, CodingKey {
        case titleString = "rendered"
    }
}

struct Content: Codable {
    var article: String
    
    enum CodingKeys: String, CodingKey {
        case article = "rendered"
    }
}

struct EmbeddedLinks: Codable {
    var featuredMedia: [FeaturedMedia]
    var author: [Author]

    enum CodingKeys: String, CodingKey {
        case featuredMedia = "wp:featuredmedia"
        case author
    }
}

struct FeaturedMedia: Codable {
    var imageUrl: String

    enum CodingKeys: String, CodingKey {
        case imageUrl = "source_url"
    }

}

struct Author : Codable {
    var name: String
    var avatar: Avatars
    
    enum CodingKeys: String, CodingKey {
        case name
        case avatar = "avatar_urls"
    }
}

struct Avatars : Codable {
    var AvatarSize24Url: String
    
    enum CodingKeys: String, CodingKey {
        case AvatarSize24Url = "24"
    }
}

struct Category : Codable {
    var name: String
}
