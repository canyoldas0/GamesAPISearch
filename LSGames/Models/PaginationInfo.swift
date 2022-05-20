//
//  PaginationInfo.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation

struct PaginationInfo {
    var resultCount: Int = 0
    var limit: Int = 10
    var offset: Int = 0
    var page: Int = 1
    var fetching: Bool = false
    
    func checkLoadingMore() -> Bool {
        return limit <= resultCount && !fetching
    }
    
    mutating func nextOffset() {
        fetching = true
        offset += limit
        page += 1
    }
    
    mutating func reset() {
        
    resultCount = 0
    limit = 10
    offset = 0
    page = 1
    }
}
