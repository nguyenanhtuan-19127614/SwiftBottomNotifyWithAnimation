//
//  GuideSection.swift
//  NotifyProj
//
//  Created by Wee on 22/08/2022.
//

import Foundation
import UIKit

class GuideSection: UICollectionReusableView {
    
    //MARK: Override Init
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = .white
        
        //add sub views
        addSubViews()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: Define Sub-views
    let sectionImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    let sectionLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Tin tức"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(red: 86/255, green: 156/255, blue: 89/255, alpha: 1)
        
        return label
        
    }()
 
    //MARK: Add subviews to cell
    func addSubViews() {
    
        addSubview(sectionImage)
        addSubview(sectionLabel)
        
    }
    
    //MARK: Add layout subviews
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        sectionImage.frame = CGRect(x: 0,
                                    y: 0,
                                    width: 20,
                                    height: self.bounds.height)
        
        sectionLabel.frame = CGRect(x: sectionImage.frame.maxX + 10,
                                    y: 0,
                                    width: self.bounds.width-sectionImage.frame.width,
                                    height: self.bounds.height)
    
        
    }
 
    func loadData(image: UIImage?, label: String) {
        
        sectionLabel.text = label
        guard let image = image else {
            return
        }

        sectionImage.image = image
        
    }
}
