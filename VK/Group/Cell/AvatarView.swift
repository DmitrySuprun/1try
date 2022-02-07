//
//  AvatarView.swift
//  VK
//
//  Created by Дмитрий Супрун on 3.02.22.
//

import UIKit

class AvatarView: UIView {

    
    
    @IBInspectable var shadowColor: UIColor = .black {
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.8 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 5 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
