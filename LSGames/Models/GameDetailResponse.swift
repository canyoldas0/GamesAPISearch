//
//  GameDetailResponse.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation

struct GameDetailResponse: Codable {
    let id: Int?
    let name, nameOriginal, gameDetailResponseDescription: String?
    let backgroundImage, backgroundImageAdditional: String?
    let website: String?
    let redditURL: String?
    let descriptionRaw: String?
    let metacritic: Int?
    let genres: [Genre]?
    let tags: [Tag]?
    let shortScreenshots: [ShortScreenshot]?

    enum CodingKeys: String, CodingKey {
        case id, name
        case nameOriginal = "name_original"
        case gameDetailResponseDescription = "description"
        case backgroundImage = "background_image"
        case backgroundImageAdditional = "background_image_additional"
        case website
        case redditURL = "reddit_url"
        case descriptionRaw = "description_raw"
        case metacritic
        case genres
        case tags
        case shortScreenshots
    }
}
