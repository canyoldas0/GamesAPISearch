//
//  URLRequest+Extension.swift
//  MovieDiary
//
//  Created by Can Yoldas on 3.12.2021.
//

import Foundation

extension URLRequest {
    
     var headers: HTTPHeaders {
        get { allHTTPHeaderFields.map(HTTPHeaders.init) ?? HTTPHeaders() }
        set { allHTTPHeaderFields = newValue.dictionary }
     }
}
