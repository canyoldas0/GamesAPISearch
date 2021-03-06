//
//  DetailVC.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit
import CYBase


class DetailVC: CYViewController<DetailVM> {
    
    private var detailView: DetailView!
    
    private var isAddedFavorites: Bool! {
        didSet {
            self.configureFavoriteButtonTitle(state: isAddedFavorites)
        }
    }
    
    lazy var favouriteButton: UIBarButtonItem = {
        let temp = UIBarButtonItem(title: "",
                                   style: .plain,
                                   target: self,
                                   action: #selector(favouriteClicked))
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = favouriteButton
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.startLoading()
        viewModel.fetchData { [weak self] viewData in
            self?.detailView.setData(data: viewData)
            self?.isAddedFavorites = viewData.isAddedFavorites
            self?.stopLoading()
        }
    }
    
    private func configureFavoriteButtonTitle(state: Bool) {
        DispatchQueue.main.async {
            self.favouriteButton.title = state ? "Favourited": "Favourite"
        }
    }
    
    
    @objc func favouriteClicked() {
        isAddedFavorites.toggle()
        viewModel.favoriteButtonClicked(state: isAddedFavorites)
    }
    
    
    override func configureUI() {
        self.detailView = DetailView()
        detailView.delegate = self
        detailView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailView)
        NSLayoutConstraint.activate([
            
            detailView.topAnchor.constraint(equalTo: view.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func showPopup(title: String) {
        let alert = UIAlertController(title: "Warning", message: title, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        self.present(alert, animated: true)
    }
    
}

extension DetailVC: ButtonRedirectCellProtocol {
    
    func openWebView(with url: String) {
        guard url != "" else {
            showPopup(title: "Unavailable URL.")
            return
        }
        let webVC = WebViewController(webUrl: url)
        self.present(webVC, animated: true)
    }
}
