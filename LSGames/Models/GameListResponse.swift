//
//  GameListResponse.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation

struct GameListResponse: Codable {
    let count: Int
    let next: String
    let previous: JSONNull?
    let results: [GameData]
    let userPlatforms: Bool

    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
        case userPlatforms = "user_platforms"
    }
}

// MARK: - Result
struct GameData: Codable {
    let name: String
    let backgroundImage: String?
    let metacritic: JSONNull?
    let id: Int
    let genres: [Genre]

    enum CodingKeys: String, CodingKey {
        case name
        case backgroundImage = "background_image"
        case metacritic
        case id
        case genres
    }
}


// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name, slug: String
}

// MARK: - Rating
struct Rating: Codable {
    let id: Int
    let title: String
    let count: Int
    let percent: Double
}


// MARK: - Tag
struct Tag: Codable {
    let id: Int
    let name, slug: String
    let gamesCount: Int
    let imageBackground: String

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
}


// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
