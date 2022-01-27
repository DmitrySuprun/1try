//
//  FriendsListTableViewCell.swift
//  VK
//
//  Created by Дмитрий Супрун on 24.01.22.
//

import UIKit

class FriendsListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contactImageVeiw: UIImageView!
    
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
        contactImageVeiw.image = nil
    }
    
    func setData(with data: FriendsListCellModel) {
        titleLabel.text = data.name
        contactImageVeiw.image = UIImage(named: data.image)
    }
}
