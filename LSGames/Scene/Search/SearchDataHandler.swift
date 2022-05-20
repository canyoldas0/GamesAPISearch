//
//  SearchDataHandler.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation
import CYBase

protocol SearchDataHandlerProtocol {
    
//    func setData(with response: [CountryData])
    func getItem(at index: Int) -> CYDataProtocol?
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getItemId(at index: Int) -> String
    func setData(with response: [GameData])
    
}

class SearchDataHandler: SearchDataHandlerProtocol {
    
    private var list: [GameData] = [GameData]()
    
    func setData(with response: [GameData]) {
        self.list.append(contentsOf: response)
    }
    
    
    func getItem(at index: Int) -> CYDataProtocol? {
        return ListCollectionViewCellData(imageUrl: list[index].backgroundImage,
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
    
    
    func getItemId(at index: Int) -> String {
        return "\(list[index].id)"
    }

}
