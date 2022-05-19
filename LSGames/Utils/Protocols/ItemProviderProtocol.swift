//
//  ItemProviderProtocol.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import Foundation
import CYBase

protocol ItemProviderProtocol: AnyObject {
    
    func askNumberOfSection() -> Int
    func askNumberOfItem(in section: Int) -> Int
    func askData(at index: Int) -> CYDataProtocol?
    func selectedItem(at index: Int)
    func getMoreData()
    func isLoadingCell(for index: Int) -> Bool
}

extension ItemProviderProtocol {
    func selectedItem(at index: Int) { }
    func getMoreData() { }
    func isLoadingCell(for index: Int) -> Bool { return false }
}
