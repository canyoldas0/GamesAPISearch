//
//  HTTPMethod.swift
//  MovieDiary
//
//  Created by Can Yoldas on 3.12.2021.
//

import Foundation

 struct HTTPMethod: RawRepresentable, Equatable, Hashable {

    public static let delete = HTTPMethod(rawValue: "DELETE")

    public static let get = HTTPMethod(rawValue: "GET")

    public static let post = HTTPMethod(rawValue: "POST")

    public static let put = HTTPMethod(rawValue: "PUT")

    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}
