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
    func getTitle(at index: Int) -> String
    func getItemId(at index: Int) -> String
    
}

//class SearchDataHandler: SearchDataHandlerProtocol {
//    
//    private var list: [GameData] = [GameData]()
//    
//    func setData(with response: [GameData]) {
//        self.list.append(contentsOf: response)
//    }
//    
//    
//    func getItem(at index: Int) -> CYDataProtocol? {
//        <#code#>
//    }
//    
//    func getNumberOfSection() -> Int {
//        <#code#>
//    }
//    
//    func getNumberOfItem(in section: Int) -> Int {
//        <#code#>
//    }
//    
//    func getTitle(at index: Int) -> String {
//        <#code#>
//    }
//    
//    func getItemId(at index: Int) -> String {
//        <#code#>
//    }
//    
//    
//    
//}
