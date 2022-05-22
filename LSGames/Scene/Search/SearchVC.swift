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
    private lazy var searchController: UISearchController = {
        let temp = UISearchController()
        temp.searchBar.placeholder = "Search for the games"
        temp.searchBar.delegate = self
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchBar()
        listenViewModel()
    }
    
    private func setSearchBar() {
        searchController.hidesNavigationBarDuringPresentation = true
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController!.navigationBar.sizeToFit()
        navigationItem.searchController = searchController
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
                self?.listView.reloadCollectionView()
            case .failure:
                break // Bottomsheet error handling?
            }
        }
        
        viewModel.listenRequestState { [weak self] request in
            let detailVC = DetailViewBuilder.build(with: request)
            self?.navigationController?.pushViewController(detailVC, animated: false)
        }
    }
    
    @objc func reload(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, text.trimmingCharacters(in: .whitespaces) != "" else {return}
        viewModel.searchGame(with: text)
    }
}

// MARK: SearchController Extension
extension SearchVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector:
        #selector(self.reload(_:)), object: searchController.searchBar)
            perform(#selector(self.reload(_:)), with: searchController.searchBar, afterDelay: 0.75)
    }
    
    
}
