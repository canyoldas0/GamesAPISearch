//
//  SearchVM.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import Foundation
import CYBase

final class SearchVM {
    
    var networkManager: SearchNetworkProtocol
    var dataHandler: SearchDataHandlerProtocol
    
    var viewState: ViewStateBlock?
    var detailRequestState: DetailRequestStateBlock?
    
    init(networkManager: SearchNetworkProtocol = SearchAPI(),
         dataHandler: SearchDataHandlerProtocol) {
        self.networkManager = networkManager
        self.dataHandler = dataHandler
    }
    
    func listenViewState(with completion: @escaping ViewStateBlock) {
        viewState = completion
    }
    
    func listenRequestState(with completion: @escaping DetailRequestStateBlock) {
        detailRequestState = completion
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
    
    func selectedItem(at index: Int) {
        detailRequestState?(GameDetailRequest(id: dataHandler.getItemId(at: index)))
    }
    
    func getMoreData() {
        guard dataHandler.paginationData.checkLoadingMore() else { return}
        dataHandler.paginationData.nextOffset()
        fetchData()
    }
}
