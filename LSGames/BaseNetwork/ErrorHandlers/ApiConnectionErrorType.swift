//
//  ApiConnectionErrorType.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation

enum ApiConnectionErrorType {
    case missingData(Int)
    case connectionError(Int)
    case serverError(Int)
    case dataDecodedFailed(String)
}
