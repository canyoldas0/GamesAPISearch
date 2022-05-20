//
//  GameDetailProvider.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation

class GameDetailProvider: ApiServiceProvider<GameDetailRequest> {
    
    init(with request: GameDetailRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.base.rawValue,
                   path: Path.gameDetail(request.id).value,
                   data: request)
    }
}


class GameDetailRequest: Codable {
    
    private(set) var key: String = "3be8af6ebf124ffe81d90f514e59856c"
    private(set) var id: Int
    
    init(id: Int) {
        self.id = id
    }
}
