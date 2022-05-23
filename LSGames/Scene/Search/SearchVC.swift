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
    
    lazy var clearSeenButton: UIButton = {
        let temp = UIButton()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.setTitle("Clean Seen Games", for: .normal)
        temp.setTitleColor(AppTheme.black.value, for: .normal)
        temp.titleLabel?.font = .systemFont(ofSize: 14)
        temp.addTarget(self, action: #selector(clearSeenClicked), for: .touchUpInside)
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addClearButton()
        setSearchBar()
        listenViewModel()
        viewModel.fetchData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideClearSeenButton(state: true)
    }
    
    
    private func setSearchBar() {
        searchController.hidesNavigationBarDuringPresentation = true
        navigationController!.navigationBar.sizeToFit()
        navigationItem.searchController = searchController
    }
    
    private func addClearButton() {
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(clearSeenButton)
        
        NSLayoutConstraint.activate([
            clearSeenButton.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -20),
            clearSeenButton.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -60),
          ])
    }
    
    private func hideClearSeenButton(state: Bool) {
        clearSeenButton.isHidden = state
        clearSeenButton.isUserInteractionEnabled = !state
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        listView.reloadCollectionView()
        hideClearSeenButton(state: false)
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
    
    @objc func clearSeenClicked() {
        print("clicked")
        PersistencyDataManager.shared.clearSeenList()
        self.listView.reloadCollectionView()
    }
    
    // MARK: ViewModel Subscriptions
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
        listView.scrollToTop()
    }
}

// MARK: SearchController Extension
extension SearchVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count >= 3 {
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector:
            #selector(self.reload(_:)), object: searchController.searchBar)
                perform(#selector(self.reload(_:)), with: searchController.searchBar, afterDelay: 0.75)
        }
    }
}
