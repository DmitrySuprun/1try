//
//  GroupTableViewCell.swift
//  VK
//
//  Created by Дмитрий Супрун on 28.01.22.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var groupImageView: UIImageView!
    @IBOutlet weak var groupLabel: UILabel!
    
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
        groupImageView.image = nil
    }
    
    func setData(with data: GroupListCellModel) {
        groupLabel.text = data.name
        groupImageView.image = UIImage(named: data.image)
    }
    
}

extension GroupTableViewCell {
    
    func circleView(image: String) {
        let size: CGFloat = 34
        let customView = AvatarView (frame: CGRect(x: 20, y: 5, width: size, height: size))
        customView.backgroundColor = .white
        customView.layer.cornerRadius = size / 2
        customView.layer.borderWidth = 3
        customView.layer.borderColor = UIColor.red.cgColor
        
        customView.layer.shadowColor = UIColor.black.cgColor
        // Сдвиг
        customView.layer.shadowOffset = CGSize(width: 5, height: 5)
        // Прозрачность
        customView.layer.shadowOpacity = 0.8
        // Размер
        customView.layer.shadowRadius = 5
        // Тень не появилась, так как установлено свойство masksToBounds, которое обрезает ее. Если убрать его, тень отобразится:
        
        let imageView = UIImageView(image: UIImage(named: "VK_Compact_Logo"))
        customView.addSubview(imageView)
        
        let topAnchor = imageView.topAnchor.constraint(equalTo: customView.topAnchor, constant: 0)
        let bottomAnchor = imageView.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: 0)
        let leftAnchor = imageView.leftAnchor.constraint(equalTo: customView.leftAnchor, constant: 0)
        let rightAnchor = imageView.rightAnchor.constraint(equalTo: customView.rightAnchor, constant: 0)

        NSLayoutConstraint.activate([topAnchor, bottomAnchor, leftAnchor, rightAnchor])

        
        contentView.addSubview(customView)
        
    }
}
