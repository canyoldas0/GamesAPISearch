//
//  FavoritesVC.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit
import CYBase

class FavoritesVC: CYViewController<FavoritesVM> {
    
    private var listView: ListTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        listenViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        viewModel.fetchData()
    }
    
    override func configureUI() {
        super.configureUI()
        self.listView = ListTableView()
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
                self?.listView.reloadTable()
            case .failure:
                break // Bottomsheet error handling?
            }
        }
        
        viewModel.listenDeleteActionState { [weak self] gameName, id in
            self?.throwDeleteActionAlert(for: gameName, id: id)
        }
        
        viewModel.listenRequestState { [weak self] request in
            let detailVC = DetailViewBuilder.build(with: request)
            self?.navigationController?.pushViewController(detailVC, animated: false)
        }
    }
        
    private func throwDeleteActionAlert(for name: String, id: Int) {
        let alert = UIAlertController(title: "Remove from favorites",
                                      message: "Are you sure about removing \(name) from favorites?",
                                      preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "Yes", style: .default) { [weak self] action in
            self?.viewModel.deleteItem(by: id)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        alert.addAction(yesButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true)
    }
}
