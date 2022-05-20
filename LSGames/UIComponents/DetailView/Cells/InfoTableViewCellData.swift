//
//  InfoTableViewCellData.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import Foundation
import CYBase

class InfoTableViewCellData: CYDataProtocol {
  
    private(set) var title: String
    private(set) var imageUrl: String
    private(set) var description: String
    
    init(title: String, imageUrl: String, description: String) {
        self.title = title
        self.imageUrl = imageUrl
        self.description = description
    }
}
