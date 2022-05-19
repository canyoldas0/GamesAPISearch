//
//  CustomFlowLayout.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit

class CustomFlowLayout: UICollectionViewFlowLayout {
    
    let cellSpacing: CGFloat = 0
    
    // Stackoverflow solution
     
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        if let attributes = super.layoutAttributesForElements(in: rect) {
//            for (index, attribute) in attributes.enumerated() {
//                if index == 0 { continue }
//                let prevLayoutAttributes = attributes[index - 1]
//                let origin = prevLayoutAttributes.frame.maxX
//                if (origin + cellSpacing + attribute.frame.size.width < self.collectionViewContentSize.width) {
//                    attribute.frame.origin.x = origin + cellSpacing
//                }
//            }
//            return attributes
//        }
//        return nil
//    }
}


