//
//  FavoritesVM.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import Foundation
import CYBase

final class FavoritesVM {
    
    var viewState: ViewStateBlock?
    var networkManager: FavoritesNetworkProtocol
    var dataHandler: ListDataHandlerProtocol
    
    
    
    init(networkManager: FavoritesNetworkProtocol = FavoritesAPI(), dataHandler: ListDataHandlerProtocol) {
        self.networkManager = networkManager
        self.dataHandler = dataHandler
    }
    
    func listenViewState(with completion: @escaping ViewStateBlock) {
        viewState = completion
    }
    
    func fetchData() {
        viewState?(.loading)
        
        networkManager.getFavoriteGames { [weak self] response in
            
            print(response.count)
            self?.dataHandler.setData(with: response)
            self?.viewState?(.done)
        }
    }
}

extension FavoritesVM: ItemProviderProtocol {
    
    func askNumberOfSection() -> Int {
        return dataHandler.getNumberOfSection()
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return dataHandler.getNumberOfItem(in: section)
    }
    
    func askData(at index: Int) -> CYDataProtocol? {
        return dataHandler.getViewData(at: index)
    }
    
    func removeSwipedCell(at index: Int) {
        
        PersistencyDataManager.shared.removeFavourite(with: dataHandler.getElement(at: index))
    }
}
