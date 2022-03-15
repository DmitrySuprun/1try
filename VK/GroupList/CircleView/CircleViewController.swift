//
//  CircleViewController.swift
//  VK
//
//  Created by Дмитрий Супрун on 31.01.22.
//

import UIKit

class CircleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addCricleView()
    }
}

private extension CircleViewController {
    func addCricleView() {
        let circleView = UIView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        circleView.backgroundColor = .blue
        view.addSubview(circleView)
    }
}
