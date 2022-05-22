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
    func removeFavourite(with id: Int )
    func checkExists(with data: GameData) -> Bool
}

struct PersistencyContainer: Codable {
    let data: [GameData]
}

class PersistencyDataManager: PersistencyDataProtocol {

    
    static let shared = PersistencyDataManager()
    static let favoriteKEY = "FavoriteGames"
    static let detailSeenKEY = "SeenGames"
    
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
    
    func removeFavourite(with id: Int) {
        queue.sync {
            saveList(with: getList().filter({ $0.id != id }))
        }
    }
    
    func checkExists(with data: GameData) -> Bool {
        queue.sync {
            return getList().contains(where: { $0.id == data.id })
        }
    }
    
    private func getList() -> [GameData] {
        guard let data = UserDefaults.standard.object(forKey: PersistencyDataManager.favoriteKEY) as? Data else {
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
            UserDefaults.standard.set(encodedData, forKey: PersistencyDataManager.favoriteKEY)
        }
    }
    
    func saveSeenToList(with ids: [Int]) {
        UserDefaults.standard.set(ids, forKey: PersistencyDataManager.detailSeenKEY)
    }
    
    func addToSeenList(id: Int) {
        queue.sync {
            var list = getSeenList()
            list.append(id)
            saveSeenToList(with: Array(Set(list)))
        }
    }
    
    func checkIfSeenBefore(with id: Int) -> Bool {
        queue.sync {
            return getSeenList().contains(where: { $0 == id })
        }
    }
    
    private func getSeenList() -> [Int] {
        guard let data = UserDefaults.standard.array(forKey: PersistencyDataManager.detailSeenKEY) as? [Int] else {return [] }
        return data
    }
}
