//
//  UICollectionView+Extensions.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit

extension UICollectionView {
    
    func registerNib(withIdentifier identifier: String) {
        register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }

    func dequeue<C: UICollectionViewCell>(at indexPath: IndexPath) -> C? {
            guard let cell = self.dequeueReusableCell(withReuseIdentifier: C.identifier, for: indexPath) as? C
                else {
                    #if DEBUG
                    fatalError("could not deque cell with identifier \(C.identifier) from collectionview \(self)")
                    #else
                    return nil
                    #endif
            }
            return cell
        }

}
