//
//  ProfileInfoCollectionViewCell.swift
//  VK
//
//  Created by Дмитрий Супрун on 27.01.22.
//

import UIKit

class ProfileInfoCollectionViewCell: UICollectionViewCell {
    
    static func nib() -> UINib {
        return UINib(nibName: "ProfileInfoCollectionViewCell", bundle: nil)
    }

    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(with data: FriendsListCellModel) {
        profileImageView.image = UIImage(named: data.image)
    }
    
    override func prepareForReuse() {
        profileImageView.image = nil
    }

}
