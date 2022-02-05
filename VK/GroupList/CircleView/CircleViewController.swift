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

        // Do any additional setup after loading the view.
    }
        

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

private extension CircleViewController {
    func addCricleView() {
        let circleView = UIView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        circleView.backgroundColor = .blue
        view.addSubview(circleView)
    }
}
