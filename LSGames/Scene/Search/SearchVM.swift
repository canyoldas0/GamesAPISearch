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
    
    init(networkManager: SearchNetworkProtocol = SearchAPI()) {
        self.networkManager = networkManager
    }
    
    func listenViewState(with completion: @escaping ViewStateBlock) {
        viewState = completion
    }
    
    func fetchData() {
        viewState?(.loading)
        
        networkManager.searchGames(with: GameListRequest(page_size: 10, page: 1)) { [weak self] response in
            switch response {
            case .success(let data):
                print(data.results[0])
                self?.viewState?(.done)
            case .failure(let error):
                self?.viewState?(.failure(error))
            }
        }
    }
    
    
}

extension SearchVM: ItemProviderProtocol {
    
    func askNumberOfSection() -> Int {
        return 0
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return 10
    }
    
    func askData(at index: Int) -> CYDataProtocol? {
        return nil
    }
}
