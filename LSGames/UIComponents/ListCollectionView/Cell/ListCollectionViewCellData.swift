//
//  ListCollectionViewCellData.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import Foundation
import CYBase

class ListCollectionViewCellData: CYDataProtocol {
    
    private(set) var imageUrl: String
    private(set) var title: String
    private(set) var metaScore: String
    private(set) var categories: String
    
    init(imageUrl: String,
         title: String,
         metaScore: String,
         categories: String) {
        self.imageUrl = imageUrl
        self.title = title
        self.metaScore = metaScore
        self.categories = categories
    }
    
}
