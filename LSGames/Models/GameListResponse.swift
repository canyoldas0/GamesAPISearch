//
//  GameListResponse.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation

// MARK: - GameListResponse
struct GameListResponse: Codable {
    let count: Int
    let results: [GameData]

    enum CodingKeys: String, CodingKey {
        case count, results
    }
}


// MARK: - Result
struct GameData: Codable {
    let id: Int
    let slug, name, released: String
    let backgroundImage: String
    let metacritic: Int
    let genres: [Genre]
    let tags: [Genre]

    enum CodingKeys: String, CodingKey {
        case id, slug, name, released
        case backgroundImage = "background_image"
        case metacritic
        case genres, tags
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name, slug: String

    enum CodingKeys: String, CodingKey {
        case id, name, slug
    }
}

