//
//  AppTheme.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit
import CYBase

enum AppTheme: CYValueProtocol {
    typealias Value = UIColor
    
    var value: UIColor {
        switch self {
            
        case .white:
            return .white
        case .black:
            return .black
        case .scoreRed:
            return UIColor(red: 0.85, green: 0.00, blue: 0.00, alpha: 1.00)
        case .detailSeen:
            return UIColor(red: 0.88, green: 0.88, blue: 0.88, alpha: 1.00)
        }
    }
    
    case white
    case black
    case scoreRed
    case detailSeen
}
