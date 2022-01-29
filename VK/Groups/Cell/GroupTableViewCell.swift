//
//  GroupTableViewCell.swift
//  VK
//
//  Created by Дмитрий Супрун on 28.01.22.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    static func nib() -> UINib {
        return UINib(nibName: "GroupTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        titleLabel.text = nil
//        contactImageVeiw.image = nil
//    }
}
