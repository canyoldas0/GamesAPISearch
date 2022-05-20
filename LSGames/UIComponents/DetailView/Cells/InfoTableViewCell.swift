//
//  InfoTableViewCell.swift
//  LSGames
//
//  Created by Can Yoldaş on 20.05.2022.
//

import UIKit
import CYBase
import Kingfisher

class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var imageContainer: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setData(with data: CYDataProtocol?) {
        guard let data = data as? InfoTableViewCellData else {return}
        imageContainer.kf.setImage(with: URL(string: data.imageUrl))
        titleLabel.text = data.title
        descriptionLabel.text = data.description
    }
    
}
