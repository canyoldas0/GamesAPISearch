//
//  GameListProvider.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation

class GameListProvider: ApiServiceProvider<GameListRequest> {
    
    init(with request: GameListRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.base.rawValue,
                   path: Path.gameDefault.value,
                   data: request)
    }
}


class GameListRequest: Codable {
    
    private(set) var key: String = "3be8af6ebf124ffe81d90f514e59856c"
    private(set) var page_size: Int
    private(set) var page: Int
    private(set) var search: String
    
    init(page_size: Int, page: Int, searchText: String) {
        self.page = page
        self.page_size = page_size
        self.search = searchText
    }
}
