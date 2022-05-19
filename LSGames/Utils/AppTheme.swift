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
            
        case .primary:
            return UIColor(red: 0.01, green: 0.09, blue: 0.15, alpha: 1.00)
        case .secondary:
            return UIColor(red: 0.00, green: 0.79, blue: 0.56, alpha: 1.00)
        case .white:
            return .white
        case .black:
            return .black
        case .starred:
            return UIColor(red: 0.99, green: 0.80, blue: 0.06, alpha: 1.00)
        }
    }
    
    case primary
    case secondary
    case white
    case black
    case starred
}
