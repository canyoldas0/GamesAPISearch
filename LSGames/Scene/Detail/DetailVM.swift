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
                print(data.descriptionRaw)
                completion(strongSelf.getDetailViewData(from: data))
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
                              favoriteButtonData: FavoriteButtonData(state: PersistencyDataManager.shared.checkExists(with: convertDetailToGameData(response: response)), isFavorited: favoriteButtonAction)
                              )
        
    }
    
    
    private lazy var favoriteButtonAction: BooleanBlock = { [weak self] value in
        guard let response = self?.detailResponse,
              let item = self?.convertDetailToGameData(response: response) else {return}
        
        value ? PersistencyDataManager.shared.addFavorite(with: item): PersistencyDataManager.shared.removeFavourite(with: item)
        print("tiklandi")
    }
    
    private func convertDetailToGameData(response: GameDetailResponse) -> GameData {
        return GameData(name: response.name,
                        backgroundImage: response.backgroundImage,
                        metacritic: response.metacritic,
                        id: response.id,
                        genres: response.genres)
    }
}



