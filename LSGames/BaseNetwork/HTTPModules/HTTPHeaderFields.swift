//
//  HTTPHeaderFields.swift
//  MovieDiary
//
//  Created by Can Yoldas on 3.12.2021.
//

import Foundation

enum HTTPHeaderFields {
    
    case contentType
    
    var value: (String, String) {
        switch self {
        case .contentType:
            return ("Content-Type", "application/json; charset=utf-8")
        }
    }

}
