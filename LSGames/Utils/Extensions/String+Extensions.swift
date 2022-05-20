//
//  String+Extensions.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation

extension String: Error {}

extension String {
    
    func asURL() throws -> URL {
        guard let url = URL(string: self) else {  throw "Missing URL" }
        return url
    }
}

// Stackoverflow solution
extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
}


