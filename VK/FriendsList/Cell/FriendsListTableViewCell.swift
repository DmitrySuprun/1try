//
//  FriendsListTableViewCell.swift
//  VK
//
//  Created by Дмитрий Супрун on 24.01.22.
//

import UIKit

class FriendsListTableViewCell: UITableViewCell {

    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "FriendsListTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        contactImageView.image = nil
    }
    
    func setData(with data: FriendsListCellModel) {
        titleLabel.text = data.name
        contactImageView.image = UIImage(named: data.image)
    }
}
