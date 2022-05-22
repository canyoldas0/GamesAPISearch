//
//  SearchDataHandler.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation
import CYBase

protocol ListDataHandlerProtocol {
    
    var paginationData: PaginationInfo { get set }
    
    func getViewData(at index: Int) -> CYDataProtocol?
    func getElement(at index: Int) -> GameData
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getItemId(at index: Int) -> Int
    func getCount() -> Int
    func setData(with response: [GameData])
    func clearList()
    func getItemName(at index:Int) -> String
    
}

class ListDataHandler: ListDataHandlerProtocol {
    
    private var list: [GameData] = [GameData]()
    var paginationData: PaginationInfo = PaginationInfo()
    
    func setData(with response: [GameData]) {
        self.paginationData.resultCount = response.count
        self.list.append(contentsOf: response)
    }
    
    func clearList() {
        self.list = []
    }
    
    func getItemName(at index: Int) -> String {
        return list[index].name ?? ""
    }
    
    func getElement(at index: Int) -> GameData {
        return list[index]
    }
    
    
    func getViewData(at index: Int) -> CYDataProtocol? {
        return ListCollectionViewCellData(imageUrl: list[index].backgroundImage ?? "",
                                          title: list[index].name ?? "",
                                          metaScore: "\(list[index].metacritic ?? 0)",
                                          categories: getCategories(at: index),
                                          isSeenBefore: PersistencyDataManager.shared.checkIfSeenBefore(with: getItemId(at: index)))
    }
    
    private func getCategories(at index: Int) -> String {
        let categoryData = list[index].genres
        
        // Getting String Array from Genre Array and formatting it to single string
        let result = categoryData?.compactMap({ $0.name}).joined(separator: ",").capitalizingFirstLetter()
        return result ?? ""
    }
    
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return list.count
    }
    
    func getCount() -> Int {
        return list.count
    }
    
    
    func getItemId(at index: Int) -> Int {
        return list[index].id!
    }

}
