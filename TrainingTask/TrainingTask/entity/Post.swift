//
//  Post.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import Foundation


struct Post: Codable {
    var title: Title
    var embedded: EmbeddedLinks
    
    enum CodingKeys: String, CodingKey {
        case title
        case embedded = "_embedded"
    }
}

struct Title: Codable {
    var titleString: String

    enum CodingKeys: String, CodingKey {
        case titleString = "rendered"
    }
}

struct EmbeddedLinks: Codable {
    var featuredMedia: [FeaturedMedia]

    enum CodingKeys: String, CodingKey {
        case featuredMedia = "wp:featuredmedia"
    }
}

struct FeaturedMedia: Codable {
    var imageUrl: String

    enum CodingKeys: String, CodingKey {
        case imageUrl = "source_url"
    }

}
