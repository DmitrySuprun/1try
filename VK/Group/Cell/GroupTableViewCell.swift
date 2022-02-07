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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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

/*
    func circleView(image: String) {
        let size: CGFloat = 34
        let customView = AvatarView (frame: CGRect(x: 20, y: 5, width: size, height: size))
        customView.backgroundColor = .white
        customView.layer.cornerRadius = size / 2
//        customView.layer.borderWidth = 3
//        customView.layer.borderColor = UIColor.red.cgColor
        
        customView.layer.shadowColor = UIColor.black.cgColor
        // Сдвиг
        customView.layer.shadowOffset = CGSize(width: 5, height: 5)
        // Прозрачность
        customView.layer.shadowOpacity = 0.8
        // Размер
        customView.layer.shadowRadius = 5
        // Тень не появилась, так как установлено свойство masksToBounds, которое обрезает ее. Если убрать его, тень отобразится:
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: size, height: size))
        imageView.image = UIImage(named: "VK_Compact_Logo")
        imageView.layer.cornerRadius = size / 2
        imageView.clipsToBounds = true
        
        customView.addSubview(imageView)
        contentView.addSubview(customView)
    }
*/
    
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
