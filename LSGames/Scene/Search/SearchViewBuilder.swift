//
//  SearchViewBuilder.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit

class SearchViewBuilder {
    
    class func build() ->  UIViewController {
        
        let dataHandler = SearchDataHandler()
        let searchVM = SearchVM(dataHandler: dataHandler)
        let searchVC = SearchVC(viewModel: searchVM)
        searchVC.title = "Games"
        searchVC.tabBarItem.image = TabBarImages.search.value
        searchVC.tabBarItem.selectedImage = TabBarImages.searchSelected.value
        let navigationVC = UINavigationController(rootViewController: searchVC)
        navigationVC.navigationBar.prefersLargeTitles = true
        navigationVC.view.backgroundColor = .systemBackground
        return navigationVC
    }
}
