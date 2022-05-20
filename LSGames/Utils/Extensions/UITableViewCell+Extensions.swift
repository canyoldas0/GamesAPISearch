//
//  UITableViewCell+Extensions.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import UIKit

extension UITableViewCell {
    
    
    static func dequeue(fromTableView tableView: UITableView, atIndexPath indexPath: IndexPath) -> Self {
        guard let cell: Self = tableView.dequeue(withIdentifier: self.identifier, at: indexPath) as? Self else {
#if DEBUG
            fatalError("*** Failed to dequeue Cell ***")
#else
            return self
#endif
        }
        return cell
    }
    
}
