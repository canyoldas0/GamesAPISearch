//
//  FavoritesViewBuilder.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit

class FavoritesViewBuilder {
    
    class func build() -> UIViewController {
        
        let favoritesVM = FavoritesVM()
        let favoritesVC = FavoritesVC(viewModel: favoritesVM)
        
        let navigationVC = UINavigationController(rootViewController: favoritesVC)
        return navigationVC
    }
}
