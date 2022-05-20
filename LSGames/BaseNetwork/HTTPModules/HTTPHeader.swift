//
//  HTTPHeader.swift
//  MovieDiary
//
//  Created by Can Yoldas on 3.12.2021.
//

import Foundation

struct HTTPHeader: Hashable {
    public let name: String
    public let value: String

    public init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}
