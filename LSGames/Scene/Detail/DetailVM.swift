//
//  DetailVM.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import Foundation

final class DetailVM {
    
    var requestData: GameDetailRequest
    var networkManager: GameDetailNetworkProtocol
    private var dataHandler: DetailDataHandlerProtocol
    private var detailResponse: GameDetailResponse?
    
    init(request: GameDetailRequest,
         dataHandler: DetailDataHandlerProtocol,
         networkManager: GameDetailNetworkProtocol = GameDetailAPI()) {
        self.requestData = request
        self.dataHandler = dataHandler
        self.networkManager = networkManager
    }
    
    
    func fetchData(with completion: @escaping (DetailViewData) -> Void) {
        
        networkManager.getDetailData(request: requestData) { [weak self] response in
            guard let strongSelf = self else {return }
            switch response {
                
            case .success(let data):
                self?.detailResponse = data
                completion(strongSelf.dataHandler.getDetailViewData(from: data))
                PersistencyDataManager.shared.addToSeenList(id: data.id)
            case .failure:
                break // DEBT: ALERT POPUP
            }
        }
    }
    
   
    func favoriteButtonClicked(state: Bool) {
        guard let response = self.detailResponse else {return}
        let id = response.id
        state ? PersistencyDataManager.shared.addFavorite(with: dataHandler.convertDetailToGameData(response: response)): PersistencyDataManager.shared.removeFavourite(with: id)
    }
    
}



