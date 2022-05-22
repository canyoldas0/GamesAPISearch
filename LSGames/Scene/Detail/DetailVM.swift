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
    
    private var detailResponse: GameDetailResponse?
    
    init(request: GameDetailRequest, networkManager: GameDetailNetworkProtocol = GameDetailAPI()) {
        self.requestData = request
        self.networkManager = networkManager
    }
    
    
    func fetchData(with completion: @escaping (DetailViewData) -> Void) {
        
        networkManager.getDetailData(request: requestData) { [weak self] response in
            guard let strongSelf = self else {return }
            switch response {
                
            case .success(let data):
                completion(strongSelf.getDetailViewData(from: data))
                PersistencyDataManager.shared.addToSeenList(id: data.id)
            case .failure(let error):
                break
            }
        }
    }
    
    func getDetailViewData(from response: GameDetailResponse) -> DetailViewData {
        self.detailResponse = response
        return DetailViewData(title: response.name,
                              imageUrl: response.backgroundImage,
                              description: response.descriptionRaw,
                              buttons: [],
                              isAddedFavorites: PersistencyDataManager.shared.checkExists(with: convertDetailToGameData(response: response)))
    }
    
    func favoriteButtonClicked(state: Bool) {
        guard let response = self.detailResponse else {return}
        let item = self.convertDetailToGameData(response: response)
        
        state ? PersistencyDataManager.shared.addFavorite(with: item): PersistencyDataManager.shared.removeFavourite(with: item)
        print("tiklandi state: \(state)")
    }
    
    private func convertDetailToGameData(response: GameDetailResponse) -> GameData {
        return GameData(name: response.name,
                        backgroundImage: response.backgroundImage,
                        metacritic: response.metacritic,
                        id: response.id,
                        tags: response.tags ,
                        shortScreenshots: response.shortScreenshots,
                        genres: response.genres)
    }
}



