//
//  SearchVM.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import Foundation
import CYBase

final class SearchVM {
    
    var viewState: ViewStateBlock?
    
    func listenViewState(with completion: @escaping ViewStateBlock) {
        viewState = completion
    }
    
    func fetchData() {
        viewState?(.loading)
    }
    
    
}

extension SearchVM: ItemProviderProtocol {
    
    func askNumberOfSection() -> Int {
        return 0
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return 10
    }
    
    func askData(at index: Int) -> CYDataProtocol? {
        return nil
    }
}
