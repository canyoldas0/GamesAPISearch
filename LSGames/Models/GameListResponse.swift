//
//  GameListResponse.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation

// MARK: - GameListResponse
struct GameListResponse: Codable {
    let count: Int?
    let results: [GameData]

    enum CodingKeys: String, CodingKey {
        case count, results
    }
}

// MARK: - Result
struct GameData: Codable {
    var name: String?
    var backgroundImage: String?
    var metacritic: Int?
    var id: Int?
    var tags: [Tag]?
    var shortScreenshots: [ShortScreenshot]?
    var genres: [Genre]?
    
    var metascore: String {
        guard let metacritic = metacritic else {
            return "No Score"
        }

        return "\(metacritic)"
    }

    enum CodingKeys: String, CodingKey {
        case name
        case backgroundImage = "background_image"
        case metacritic
        case id, tags
        case shortScreenshots = "short_screenshots"
        case genres
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name, slug: String?
}

// MARK: - ShortScreenshot
struct ShortScreenshot: Codable {
    let id: Int?
    let image: String?
}

// MARK: - Tag
struct Tag: Codable {
    let id: Int?
    let name: String?
    let imageBackground: String?

    enum CodingKeys: String, CodingKey {
        case id, name
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

    public func hash(into hasher: inout Hasher) {
        // No-op
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
