//
//  FavoritesAPI.swift
//  LSGames
//
//  Created by Can Yoldaş on 21.05.2022.
//

import Foundation

typealias FavoriteGameListResponse = ([GameData]) -> Void
protocol FavoritesNetworkProtocol {
    
    func getFavoriteGames(completion: @escaping FavoriteGameListResponse)
    
}

class FavoritesAPI: FavoritesNetworkProtocol {
    
    func getFavoriteGames(completion: @escaping FavoriteGameListResponse) {
        PersistencyDataManager.shared.getFavoriteItems(with: completion)
    }
}
