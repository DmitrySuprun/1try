//
//  GroupTableViewCell.swift
//  VK
//
//  Created by Дмитрий Супрун on 28.01.22.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var groupImageAvatarView: AvatarView!

    static func nib() -> UINib {
        return UINib(nibName: "GroupTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        groupLabel.text = nil
        // Требуется доработка!!!
//        groupImageAvatarView.image = nil
    }
    
    func setData(with data: GroupListCellModel) {
        groupLabel.text = data.name
//        groupImageView.image = UIImage(named: data.image)
    }
    
}

extension GroupTableViewCell {

    func circleView(image: String) {
        
        let size: CGFloat = 34
        
        groupImageAvatarView.layer.cornerRadius = size / 2
        groupImageAvatarView.layer.shadowColor = groupImageAvatarView.shadowColor.cgColor
        groupImageAvatarView.layer.shadowOffset = CGSize(width: 5, height: 5)
        groupImageAvatarView.layer.shadowOpacity = groupImageAvatarView.shadowOpacity
        groupImageAvatarView.layer.shadowRadius = groupImageAvatarView.shadowRadius
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        imageView.image = UIImage(named: image)
        imageView.layer.cornerRadius = size / 2
        imageView.clipsToBounds = true
        
        groupImageAvatarView.addSubview(imageView)
    }
}
