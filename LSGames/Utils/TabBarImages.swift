//
//  TabBarImages.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit
import CYBase

enum TabBarImages: String, CYValueProtocol {

    typealias Value = UIImage
    
    var value: UIImage {
        return UIImage(imageLiteralResourceName: rawValue)
    }
    
    case home = "home"
    case favorite = "favorite"
    case homeSelected = "homeSelected"
    case favoriteSelected = "favoriteSelected"
    
}
