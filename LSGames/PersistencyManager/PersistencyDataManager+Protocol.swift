//
//  PersistencyDataManager+Protocol.swift
//  LSGames
//
//  Created by Can Yoldaş on 21.05.2022.
//

import Foundation

protocol PersistencyDataProtocol {
    
    func getFavoriteItems(with completion: @escaping ([GameData]) -> Void)
    func addFavorite(with data: GameData)
    func removeFavourite(with data: GameData)
    func checkExists(with data: GameData) -> Bool
}

struct PersistencyContainer: Codable {
    let data: [GameData]
}

class PersistencyDataManager: PersistencyDataProtocol {

    
    static let shared = PersistencyDataManager()
    static let KEY = "FavoriteGames"
    
    private let queue = DispatchQueue(label: "snycQueue", qos: .default)
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    
    func getFavoriteItems(with completion: @escaping ([GameData]) -> Void) {
        queue.sync {
            completion(getList())
        }
    }
    
    func addFavorite(with data: GameData) {
        queue.sync {
            var list = getList()
            list.append(data)
            saveList(with: list)
        }
    }
    
    func removeFavourite(with data: GameData) {
        queue.sync {
            saveList(with: getList().filter({ $0.id != data.id }))
        }
    }
    
    func checkExists(with data: GameData) -> Bool {
        queue.sync {
            return getList().contains(where: { $0.id == data.id })
        }
    }
    
    private func getList() -> [GameData] {
        guard let data = UserDefaults.standard.object(forKey: PersistencyDataManager.KEY) as? Data else {
            return []
        }
        if let decodedData = try? decoder.decode(PersistencyContainer.self, from: data) {
            return decodedData.data
        }
        return []
    }
    
    private func saveList(with data: [GameData]) {
        let data = PersistencyContainer(data: data)
        if let encodedData = try? encoder.encode(data) {
            UserDefaults.standard.set(encodedData, forKey: PersistencyDataManager.KEY)
        }
    }
    
    
}
