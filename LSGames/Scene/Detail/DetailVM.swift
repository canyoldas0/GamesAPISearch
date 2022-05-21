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
        return DetailViewData(title: response.name,
                              imageUrl: response.backgroundImage,
                              description: response.descriptionRaw,
                              buttons: [])
    }
    
}
