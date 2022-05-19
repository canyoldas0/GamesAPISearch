//
//  UICollectionViewCell+Extensions.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit

extension UICollectionViewCell {
    
    static func dequeue(fromCollectionView collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> Self {
        guard let cell: Self = collectionView.dequeue(at: indexPath) as? Self else {
#if DEBUG
            fatalError("*** Failed to dequeue Cell ***")
#else
            return self
#endif
        }
        return cell
    }
}
