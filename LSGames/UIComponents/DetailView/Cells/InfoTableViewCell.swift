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
        
    func setData(with data: CYDataProtocol?) {
        guard let data = data as? InfoTableViewCellData else {return}
        imageContainer.kf.setImage(with: URL(string: data.imageUrl))
        titleLabel.text = data.title
        setupDescriptionLabel(with: data.description)
        layoutIfNeeded()
    }
    
    private func setupDescriptionLabel(with text: String) {
        var stringTemp = "No description available for now."
        if text != "" {
            stringTemp = text
        }
        
        let attributedString = NSMutableAttributedString(string: stringTemp)
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = 15
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range:NSMakeRange(0, attributedString.length))
        descriptionLabel.attributedText = attributedString
    }
    
}
