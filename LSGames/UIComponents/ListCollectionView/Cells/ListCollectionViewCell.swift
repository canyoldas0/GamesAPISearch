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
        imageView.kf.indicatorType = .activity
        imageView.kf.setImage(with: URL(string: data.imageUrl))
        categoryLabel.text = data.categories
        scoreLabel.text =  (data.metaScore != 0) ? "\(data.metaScore)": "No score"
        titleLabel.text = data.title
        backgroundColor = data.isSeenBefore ? AppTheme.detailSeen.value: AppTheme.white.value
        layoutIfNeeded()
    }
    
}
