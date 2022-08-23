//
//  UILabelExtention.swift
//  NotifyProj
//
//  Created by Wee on 22/08/2022.
//

import Foundation

import UIKit

extension UILabel {
    
    func calculateHeight(frame: CGRect) -> CGFloat {
        
        let label = UILabel()
        label.frame = frame
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        label.font = self.font
        label.text = self.text
        label.attributedText = self.attributedText
       
        label.sizeToFit()
        
        return label.frame.height
        
    }
    
}
