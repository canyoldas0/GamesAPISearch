//
//  ListTableView.swift
//  LSGames
//
//  Created by Can Yoldaş on 22.05.2022.
//

import UIKit
import CYBase

class ListTableView: BaseView {
    
    weak var delegate: ItemProviderProtocol?
    
    private lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.separatorStyle = .none
        temp.rowHeight = 136
        temp.allowsSelection = true
        temp.registerNib(withIdentifier: SwipeTableViewCell.identifier)
        return temp
    }()
    
    override func addViewComponents() {
        super.addViewComponents()
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
        
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension ListTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.askNumberOfItem(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = delegate?.askData(at: indexPath.row) else { return UITableViewCell() }
        let cell = SwipeTableViewCell.dequeue(fromTableView: tableView, atIndexPath: indexPath)
        cell.setData(with: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.startTappedAnimation(with: { [weak self] finish in
            if finish {
                self?.delegate?.selectedItem(at: indexPath.row)
            }
        })
    }
    
    // Swipe to Delete Action
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive,
                                        title: "Delete") { [weak self] action,view,completion in
            view.startTappedAnimation { [weak self] finish in
                if finish {
                    self?.delegate?.removeSwipedCell(at: indexPath.row)
                }
            }
            
        }
        
        action.backgroundColor = AppTheme.scoreRed.value
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    
}
