//
//  LoadingView.swift
//  VK
//
//  Created by Дмитрий Супрун on 20.02.22.
//

import UIKit

class LoadingView: UIView {
    
    let point: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "⚽️"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    let point1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "⚽️"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    let point2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "⚽️"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    let stackView = UIStackView()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        stackView.addArrangedSubview(point)
        stackView.addArrangedSubview(point1)
        stackView.addArrangedSubview(point2)
        addSubview(stackView)
        
    }
    private func animate() {
        
    }


}
