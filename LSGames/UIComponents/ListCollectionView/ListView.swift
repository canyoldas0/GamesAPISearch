//
//  ListCollectionView.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit
import CYBase

class ListView: BaseView {
    
    weak var delegate: ItemProviderProtocol?
    
    private lazy var collectionView: UICollectionView = {
        let layout = CustomFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 136)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let temp = UICollectionView(frame: .zero, collectionViewLayout: layout)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.showsHorizontalScrollIndicator = false
        temp.registerNib(withIdentifier: ListCollectionViewCell.identifier)
        temp.register(LoadingCellView.self, forCellWithReuseIdentifier: LoadingCellView.identifier)
        return temp
    }()
    
    override func setupViews() {
        super.setupViews()
        addCollectionView()
    }
    
    private func addCollectionView() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    // TODO: Not sure If this will work, Check later on.
    // @MainActor
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func isLoadingCell(for indexPath: IndexPath) -> Bool {
        return delegate?.isLoadingCell(for: indexPath.row) ?? false
    }
    
}


extension ListView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.askNumberOfItem(in: section) ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if isLoadingCell(for: indexPath) {
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LoadingCellView.identifier,
                for: indexPath) as? LoadingCellView else { fatalError() }
            return cell
        } else {
            guard let data = delegate?.askData(at: indexPath.row) else { return UICollectionViewCell() }
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.identifier, for: indexPath) as? ListCollectionViewCell else { return UICollectionViewCell() }
//            let mockData = ListCollectionViewCellData(imageUrl: "https://media.rawg.io/media/games/ffe/ffed87105b14f5beff72ff44a7793fd5.jpg",
//                                                      title: "GTA V", metaScore: "85", categories: "Action")
            cell.setData(with: data)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if isLoadingCell(for: indexPath) {
            delegate?.getMoreData()
        }
    }

}
