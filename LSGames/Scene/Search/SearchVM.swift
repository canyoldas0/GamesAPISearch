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
        
        networkManager.searchGames(with: GameListRequest(page_size: 10, page: dataHandler.paginationData.page)) { [weak self] response in
            switch response {
            case .success(let response):
                self?.handleSuccessResponse(response)
            case .failure(let error):
                self?.viewState?(.failure(error))
            }
        }
    }
    
    private func handleSuccessResponse(_ response: GameListResponse ) {
        self.dataHandler.paginationData.fetching = false
        self.dataHandler.setData(with: response.results)
        self.viewState?(.done)
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
    
    func isLoadingCell(for index: Int) -> Bool {
        return index + 1 >= dataHandler.getCount()
    }
    
    func getMoreData() {
        guard dataHandler.paginationData.checkLoadingMore() else { return}
        dataHandler.paginationData.nextOffset()
        fetchData()
    }
}
