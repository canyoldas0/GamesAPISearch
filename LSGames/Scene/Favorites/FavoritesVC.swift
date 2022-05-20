//
//  FavoritesVC.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit
import CYBase

class FavoritesVC: CYViewController<FavoritesVM> {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        listenViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchData()
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
