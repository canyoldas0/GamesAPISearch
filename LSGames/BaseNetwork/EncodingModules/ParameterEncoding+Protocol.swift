//
//  ParameterEncoding.swift
//  MovieDiary
//
//  Created by Can Yoldas on 3.12.2021.
//

import Foundation

 typealias Parameters = [String: Any]

 protocol ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

enum ParameterEncoding {
    
    case urlEncoding
    case jsonEncoding
    
     func encode(urlRequest: inout URLRequest, parameters: Parameters?) throws {
        
        do {
            switch self {
            case .urlEncoding:
                guard let urlParameters = parameters else { return }
                try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
                
            case .jsonEncoding:
                guard let bodyParameters = parameters else { return }
                try JSONParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
                
            }
            
        } catch {
            throw error
        }
    }
}
