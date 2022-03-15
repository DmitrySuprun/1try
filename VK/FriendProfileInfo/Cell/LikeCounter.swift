//
//  LikeCounter.swift
//  VK
//
//  Created by Дмитрий Супрун on 8.02.22.
//

import UIKit

class LikeCounter: UIControl {
    
    var likeCount: Int = 0
    
    private var buttonAndLabel: [UIView] = []
    private var stackView: UIStackView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
        
        let button = UIButton(type: .system)
        button.setTitle("🤍", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.red, for: .selected)
        button.addTarget(self, action: #selector(likePress(_:)), for: .touchUpInside)
        self.buttonAndLabel.append(button)
        
        let label = UILabel()
        label.text = String(likeCount)
        label.textColor = .red
        self.buttonAndLabel.append(label)
        
        stackView = UIStackView(arrangedSubviews: buttonAndLabel)
        self.addSubview(stackView)
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
    }
    
    @objc private func likePress(_ sender: UIButton) {
        let label = buttonAndLabel[1] as! UILabel
        if sender.titleLabel?.text == "🤍" {
            sender.setTitle("❤️", for: .normal)
            label.text = "1"
        } else {
            sender.setTitle("🤍", for: .normal)
            label.text = "0"

        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
}
