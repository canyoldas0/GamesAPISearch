//
//  SearchVC.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit
import CYBase

class SearchVC: CYViewController<SearchVM> {
    
    private var listView: ListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listenViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchData()
    }
    
    
    override func configureUI() {
        super.configureUI()
        self.listView = ListView()
        listView.translatesAutoresizingMaskIntoConstraints = false
        listView.delegate = viewModel
        view.addSubview(listView)
        
        NSLayoutConstraint.activate([
        
            listView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    
    private func listenViewModel() {
        
        viewModel.listenViewState { [weak self] state in
            switch state {
                
            case .loading:
                self?.startLoading()
            case .done:
                self?.stopLoading()
                // refresh tableview
            case .failure:
                break // Bottomsheet error handling?
            }
        }
    }
}
