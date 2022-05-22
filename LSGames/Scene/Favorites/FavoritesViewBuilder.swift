//
//  FavoritesViewBuilder.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit

class FavoritesViewBuilder {
    
    class func build() -> UIViewController {
        
        let dataHandler = ListDataHandler()
        let favoritesVM = FavoritesVM(dataHandler: dataHandler)
        let favoritesVC = FavoritesVC(viewModel: favoritesVM)
        favoritesVC.title = "Favorites"
        favoritesVC.tabBarItem.image = TabBarImages.favorite.value
        favoritesVC.tabBarItem.selectedImage = TabBarImages.favoriteSelected.value
        let navigationVC = UINavigationController(rootViewController: favoritesVC)
        navigationVC.navigationBar.prefersLargeTitles = true
        return navigationVC
    }
}
