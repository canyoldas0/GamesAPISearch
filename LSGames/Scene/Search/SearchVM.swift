//
//  SearchVM.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import Foundation
import CYBase

final class SearchVM {
    
    var viewState: ViewStateBlock?
    var networkManager: SearchNetworkProtocol
    var dataHandler: SearchDataHandlerProtocol
    
    init(networkManager: SearchNetworkProtocol = SearchAPI(),
         dataHandler: SearchDataHandlerProtocol) {
        self.networkManager = networkManager
        self.dataHandler = dataHandler
    }
    
    func listenViewState(with completion: @escaping ViewStateBlock) {
        viewState = completion
    }
    
    func fetchData() {
        viewState?(.loading)
        
        networkManager.searchGames(with: GameListRequest(page_size: 10, page: 1)) { [weak self] response in
            switch response {
            case .success(let data):
                self?.dataHandler.setData(with: data.results)
                self?.viewState?(.done)
            case .failure(let error):
                self?.viewState?(.failure(error))
            }
        }
    }
}

extension SearchVM: ItemProviderProtocol {
    
    func askNumberOfSection() -> Int {
        return dataHandler.getNumberOfSection()
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return dataHandler.getNumberOfItem(in: section)
    }
    
    func askData(at index: Int) -> CYDataProtocol? {
        return dataHandler.getItem(at: index)
    }
}
