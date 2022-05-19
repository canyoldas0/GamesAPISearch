//
//  ListCollectionViewCell.swift
//  LSGames
//
//  Created by Can Yoldaş on 19.05.2022.
//

import UIKit
import CYBase
import Kingfisher

class ListCollectionViewCell: CYCollectionViewCell {

    // MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func setData(with data: CYDataProtocol) {
        guard let data = data as? ListCollectionViewCellData else { return}
        imageView.kf.setImage(with: URL(string: data.imageUrl))
        categoryLabel.text = data.categories
        scoreLabel.text = data.metaScore
        titleLabel.text = data.title
        layoutIfNeeded()
    }
    
}
