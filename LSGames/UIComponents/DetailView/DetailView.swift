//
//  DetailView.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import UIKit
import CYBase

struct ButtonRedirectData {
    
    let buttonTitle: String
    let buttonUrl: String
}


class DetailViewData: CYDataProtocol {
    
    private(set) var title: String
    private(set) var imageUrl: String
    private(set) var description: String
    private(set) var buttons: [ButtonRedirectData]
    
    init(title: String, imageUrl: String, description: String, buttons: [ButtonRedirectData]) {
        self.title = title
        self.imageUrl = imageUrl
        self.description = description
        self.buttons = buttons
    }
}

class DetailView: CYBaseView<DetailViewData> {
    
    enum DetailTableViewSection {
        
        case infoSection
        case buttonSection
    }
    
    var tableViewSections: [DetailTableViewSection] = [.infoSection, .buttonSection]
    
    private lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.separatorStyle = .singleLine
        temp.estimatedRowHeight = UITableView.automaticDimension
        temp.rowHeight = UITableView.automaticDimension
//        temp.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
//        temp.register(LoadingTableViewCell.self, forCellReuseIdentifier: LoadingTableViewCell.identifier)
        return temp
    }()
    
    override func addViewComponents() {
        super.addViewComponents()
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension DetailView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        let section = tableViewSections[section]
        
        switch section {
        case .infoSection:
            guard returnData() != nil else {return 0}
            return 1
        case .buttonSection:
            guard let data = returnData() else {return 0}
            return data.buttons.count
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewSections.count
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
