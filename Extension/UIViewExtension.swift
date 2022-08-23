//
//  UIViewExtension.swift
//  NotifyProj
//
//  Created by Wee on 22/08/2022.
//

import Foundation
import UIKit

extension UIView {
    
    func setGradientBackground(colors: [CGColor]) {
        
        self.layoutIfNeeded()
        
        let gradient = CAGradientLayer()
        
        gradient.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        gradient.colors = colors

        self.layer.insertSublayer(gradient, at: 0)
        
    
    }
}
