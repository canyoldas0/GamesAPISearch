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
        return UIImage(systemName: rawValue)!
    }
    
    case search = "gamecontroller"
    case favorite = "star"
    case searchSelected = "gamecontroller.fill"
    case favoriteSelected = "star.fill"
    
}
