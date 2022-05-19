//
//  SearchAPI.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation

typealias denemeBlock = (Result<String,ErrorResponse>) -> Void // TODO: Dummy Block just to try out networkService
protocol SearchNetworkProtocol: AnyObject {
    
    func searchGames(with request: GameListRequest, completion: @escaping denemeBlock)
}

class SearchAPI: SearchNetworkProtocol {
    
    func searchGames(with request: GameListRequest, completion: @escaping denemeBlock) {
        do {
            guard let urlRequest = try? GameListProvider(with: request).returnUrlRequest() else {return}
        BaseNetworkManager.shared.sendRequest(urlRequest: urlRequest, completion: completion)
        }
    }
}

class mockAPI: SearchNetworkProtocol {
    
    
    // TODO: MockService for Tests
    func searchGames(with request: GameListRequest, completion: @escaping denemeBlock) {
        completion(.success(""))
    }
    
    
}
