//
//  ABCControl.swift
//  VK
//
//  Created by Дмитрий Супрун on 9.02.22.
//

import UIKit

class ABCControl: UIControl {
    
    var arrayOfCaps: [String] = ["A","B","C","D","E","F","G"]

    private var buttonsABC: [UIView] = []
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
        for cap in arrayOfCaps {
            let button = UIButton(type: .system)
            button.setTitle(cap, for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectSection(_:)), for: .touchUpInside)
            self.buttonsABC.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: self.buttonsABC)
        
        self.addSubview(stackView)
        
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        
    }
    

    
    @objc private func selectSection(_ sender: UIButton) {
        guard let index = self.buttonsABC.firstIndex(of: sender) else { return }
        let caps = buttonsABC[index]
        print(index)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    

}
