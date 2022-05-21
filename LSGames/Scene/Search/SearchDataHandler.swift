//
//  SearchDataHandler.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation
import CYBase

protocol SearchDataHandlerProtocol {
    
    var paginationData: PaginationInfo { get set }
    
    func getItem(at index: Int) -> CYDataProtocol?
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getItemId(at index: Int) -> Int
    func getCount() -> Int
    func setData(with response: [GameData])
    
}

class SearchDataHandler: SearchDataHandlerProtocol {
    
    private var list: [GameData] = [GameData]()
    var paginationData: PaginationInfo = PaginationInfo()
    
    func setData(with response: [GameData]) {
        self.paginationData.resultCount = response.count
        self.list.append(contentsOf: response)
    }
    
    
    func getItem(at index: Int) -> CYDataProtocol? {
        return ListCollectionViewCellData(imageUrl: list[index].backgroundImage ?? "",
                                          title: list[index].name,
                                          metaScore: "\(list[index].metacritic)",
                                          categories: getCategories(at: index))
    }
    
    private func getCategories(at index: Int) -> String {
        let categoryData = list[index].genres
        
        // Getting String Array from Genre Array and formatting it to single string
        let result = categoryData.map({ $0.name}).joined(separator: ",").capitalizingFirstLetter()
        return result
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
        return list[index].id
    }

}
