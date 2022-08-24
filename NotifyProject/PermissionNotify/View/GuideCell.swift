//
//  GuideCell.swift
//  NotifyProj
//
//  Created by Wee on 22/08/2022.
//

import Foundation
import UIKit

class GuideCell: UICollectionViewCell {
    
    //Define Variable
    let guideLabel: UILabel = {
        
        let label = UILabel()
        label.font = label.font.withSize(18)
        label.lineBreakMode = .byWordWrapping
        return label
        
    }()
    
    func addSubViews() {
        
        self.addSubview(guideLabel)
        
    }
    
    //Init
    override init(frame: CGRect) {
            
        super.init(frame: frame)
        self.backgroundColor = .white
       
        addSubViews()
    }
        
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func layoutSubviews() {
        
        guideLabel.frame = CGRect(x: 0,
                             y: 0,
                             width: self.frame.width,
                             height: self.frame.height)
        guideLabel.numberOfLines = 0
        guideLabel.sizeToFit()
        
    }
    
    func loadData(label: String) {
        
        guideLabel.text = label
        
    }
   
}
