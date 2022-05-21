//
//  FavoritesVM.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import Foundation

final class FavoritesVM {
    
    var viewState: ViewStateBlock?
    var networkManager: FavoritesNetworkProtocol
    
    init(networkManager: FavoritesNetworkProtocol = FavoritesAPI()) {
        self.networkManager = networkManager
    }
    
    func listenViewState(with completion: @escaping ViewStateBlock) {
        viewState = completion
    }
    
    func fetchData() {
        viewState?(.loading)
        
        networkManager.getFavoriteGames { [weak self] response in
            
            // self?.dataHandler.setData(from: response)
            self?.viewState?(.done)
        }
    }
}
