//
//  DetailDataHandler.swift
//  LSGames
//
//  Created by Can Yoldaş on 23.05.2022.
//

import Foundation


protocol DetailDataHandlerProtocol: AnyObject {
    
    func getDetailViewData(from response: GameDetailResponse) -> DetailViewData
    func convertDetailToGameData(response: GameDetailResponse) -> GameData
}

class DetailDataHandler: DetailDataHandlerProtocol {
    
    func getDetailViewData(from response: GameDetailResponse) -> DetailViewData {
        let visitWebButtons = [ButtonRedirectData(buttonTitle: "Visit Reddit",
                                                  buttonUrl: response.redditURL ?? ""),
                                ButtonRedirectData(buttonTitle: "Visit Website",
                                                   buttonUrl: response.website ?? "")
        ]
        return DetailViewData(title: response.name ?? "",
                              imageUrl: response.backgroundImage ?? "",
                              description: response.descriptionRaw ?? "",
                              buttons: visitWebButtons,
                              isAddedFavorites: PersistencyDataManager.shared.checkExists(with: convertDetailToGameData(response: response)))
    }
    
    
    
     func convertDetailToGameData(response: GameDetailResponse) -> GameData {
        return GameData(name: response.name,
                        backgroundImage: response.backgroundImage,
                        metacritic: response.metacritic,
                        id: response.id,
                        tags: response.tags ,
                        shortScreenshots: response.shortScreenshots,
                        genres: response.genres)
    }
    
    
}
