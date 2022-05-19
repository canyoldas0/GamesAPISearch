//
//  ErrorResponse.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation

class ErrorResponse: Error {
     let serverResponse: ServerResponse?
     let apiConnectionErrorType: ApiConnectionErrorType?

     init(serverResponse: ServerResponse? = nil, apiConnectionErrorType: ApiConnectionErrorType? = nil) {
        self.serverResponse = serverResponse
        self.apiConnectionErrorType = apiConnectionErrorType
    }

}
