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
    let next: String
    let previous: JSONNull?
    let results: [GameData]

    enum CodingKeys: String, CodingKey {
        case count, next, previous, results
    }
}


// MARK: - Result
struct GameData: Codable {
    let id: Int
    let slug, name, released: String
    let tba: Bool
    let backgroundImage: String
    let rating: Double
    let ratingTop: Int
    let ratings: [Rating]
    let metacritic, playtime, suggestionsCount: Int
    let reviewsCount: Int
    let genres: [Genre]
    let tags: [Genre]

    enum CodingKeys: String, CodingKey {
        case id, slug, name, released, tba
        case backgroundImage = "background_image"
        case rating
        case ratingTop = "rating_top"
        case ratings
        case metacritic, playtime
        case suggestionsCount = "suggestions_count"
        case reviewsCount = "reviews_count"
        case genres, tags
    }
}

// MARK: - Genre
struct Genre: Codable {
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

// MARK: - Rating
struct Rating: Codable {
    let id: Int
    let title: Title
    let count: Int
    let percent: Double
}

enum Title: String, Codable {
    case exceptional = "exceptional"
    case meh = "meh"
    case recommended = "recommended"
    case skip = "skip"
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
