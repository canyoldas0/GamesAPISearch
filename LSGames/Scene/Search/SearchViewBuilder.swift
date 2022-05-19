//
//  SearchViewBuilder.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit

class SearchViewBuilder {
    
    class func build() ->  UIViewController {
        
        let searchVM = SearchVM()
        let searchVC = SearchVC(viewModel: searchVM)
        
        let navigationVC = UINavigationController(rootViewController: searchVC)
        return navigationVC
    }
}
