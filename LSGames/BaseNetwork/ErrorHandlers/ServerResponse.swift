//
//  ServerResponse.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation

class ServerResponse: Codable, Error {
    let returnMessage: String?
    let returnCode: Int?

    init(returnMessage: String? = nil, returnCode: Int? = nil) {
       self.returnMessage = returnMessage
       self.returnCode = returnCode
   }
}
