//
//  SwipeTableViewCell.swift
//  LSGames
//
//  Created by Can Yoldaş on 22.05.2022.
//

import UIKit
import CYBase
import Kingfisher

class SwipeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(with data: CYDataProtocol) {
        guard let data = data as? ListCollectionViewCellData else { return}
        imageContainer.kf.indicatorType = .activity
        imageContainer.kf.setImage(with: URL(string: data.imageUrl))
        categoryLabel.text = data.categories
        scoreLabel.text = data.metaScore
        titleLabel.text = data.title
        layoutIfNeeded()
    }
    
}
