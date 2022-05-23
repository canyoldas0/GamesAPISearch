//
//  GameDetailAPI.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation

typealias GameDetailResponseBlock = (Result<GameDetailResponse, ErrorResponse>) -> Void

protocol GameDetailNetworkProtocol: AnyObject {
    
    func getDetailData(request: GameDetailRequest, completion: @escaping GameDetailResponseBlock)
}

class GameDetailAPI: GameDetailNetworkProtocol {
    
    func getDetailData(request: GameDetailRequest, completion: @escaping GameDetailResponseBlock) {
        do {
            guard let urlRequest = try? GameDetailProvider(with: request).returnUrlRequest() else { return}
            BaseNetworkManager.shared.sendRequest(urlRequest: urlRequest, completion: completion)
        }
    }
}
