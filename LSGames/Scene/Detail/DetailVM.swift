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
    
    
    func fetchData() {
        
        networkManager.getDetailData(request: requestData) { response in
            switch response {
                
            case .success(let data):
                print(data.descriptionRaw)
            case .failure(let error):
                break
            }
        }
    }
    
}
