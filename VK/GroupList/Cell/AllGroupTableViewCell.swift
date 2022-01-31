//
//  AllGroupTableViewCell.swift
//  VK
//
//  Created by Дмитрий Супрун on 31.01.22.
//

import UIKit

class AllGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var allGroupImageCell: UIImageView!
    @IBOutlet weak var allGroupNameCell: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "AllGroupTableViewCell", bundle: nil)
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
        allGroupNameCell.text = nil
        allGroupImageCell.image = nil
    }
    
    func setData(with data: AllGroupCellModel) {
        allGroupNameCell.text = data.name
        allGroupImageCell.image = UIImage(named: data.image)
    }
    
}
