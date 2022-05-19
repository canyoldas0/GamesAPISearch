//
//  EndpointHelper.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation
import CYBase

typealias BaseUrl = EndpointHelper.BaseUrls
typealias Path = EndpointHelper.Paths


enum EndpointHelper {
    
    enum BaseUrls: String {
        case base = "https://api.rawg.io/api/"
        
    }
    
    enum Paths: CYValueProtocol {
        
        typealias Value = String
        
        var value: String {
            switch self {
            case .gameDefault:
                return "games"
            case .searchGame:
                return "games"
            case .gameDetail(let id):
                return "games/\(id)"
                
            }
        }
        
        case gameDefault
        case searchGame
        case gameDetail(Int)
        
    }
}
