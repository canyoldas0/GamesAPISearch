//
//  FavoritesVM.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import Foundation

final class FavoritesVM {
    
    var viewState: ViewStateBlock?
    
    func listenViewState(with completion: @escaping ViewStateBlock) {
        viewState = completion
    }
    
    func fetchData() {
        viewState?(.loading)
    }
}
