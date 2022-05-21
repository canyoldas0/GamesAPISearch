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
    private var buttonData: FavoriteButtonData?
    lazy var favouriteButton: UIBarButtonItem = {
        let temp = UIBarButtonItem(title: "Favourite",
                                   style: .plain,
                                   target: self,
                                   action: #selector(favouriteClicked))
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = favouriteButton
        navigationController?.navigationBar.prefersLargeTitles = false
        self.startLoading()
        viewModel.fetchData { [weak self] viewData in
            self?.detailView.setData(data: viewData)
            self?.configureFavoriteButtonTitle(state: viewData.favoriteButtonData.state)
            self?.buttonData = viewData.favoriteButtonData
            self?.stopLoading()
        }
    }
    
    private func configureFavoriteButtonTitle(state: Bool) {
        favouriteButton.title = state ? "Favourited": "Favourite"
    }
    
    
    @objc func favouriteClicked() {
        print("hello")
        guard let data = buttonData else { return }
        configureFavoriteButtonTitle(state: data.state)
        data.state.toggle()
        print(data.state)
        data.isFavorited(data.state)
    }
    
    
    override func configureUI() {
        self.detailView = DetailView()
        detailView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailView)
        NSLayoutConstraint.activate([
            
            detailView.topAnchor.constraint(equalTo: view.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}
