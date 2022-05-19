//
//  MainTabBarBuilder.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit

class MainTabBarBuilder {
    
    class func build() -> UIViewController {
        
        let searchVC = SearchViewBuilder.build()
        let favoritesVC = FavoritesViewBuilder.build()

        let tabViewController = MainTabBarController()
        tabViewController.viewControllers = [searchVC, favoritesVC]
        tabViewController.tabBar.tintColor = .black
        
        return tabViewController
        
    }
    
}
