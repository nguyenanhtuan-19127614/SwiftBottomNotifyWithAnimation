//
//  OpinionContentView.swift
//  NotifyProj
//
//  Created by Wee on 22/08/2022.
//

import Foundation
import UIKit


class DeleteAllContentView: UIView {
    
    let deleteAllModel = DeleteAllModel()
    
   
    //Delete All Icon
    let iconImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image  = UIImage(named: "delete")
        imageView.contentMode = .scaleToFill
       
        return imageView
        
    }()
    
    //Delete All Label
    let label: UILabel = {
        
        let label = UILabel()
        label.textColor = UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1)
        
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
        
    }()
    
    //Description Label
    let descriptionLabel: UILabel = {
        
        let label = UILabel()
       
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    //Delete Button
    let deleteBtn: UIButton = {
        
        let btn = UIButton()
        
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true

        return btn
        
    }()
    
    //Cancel text
    let cancelText: UILabel = {
        
        let textView = UILabel()
        
        textView.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
    
        return textView
        
    }()
    
    
    //Add subview
    func addSubviews() {
        
        self.addSubview(iconImage)
        self.addSubview(label)
        self.addSubview(descriptionLabel)
        self.addSubview(deleteBtn)
        self.addSubview(cancelText)
        
    }
    
    //Add Layout
    func addLayout() {
        
        //Active Contraint
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        deleteBtn.translatesAutoresizingMaskIntoConstraints = false
        cancelText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            iconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            iconImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            iconImage.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4),
            iconImage.heightAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4),
            
            label.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            descriptionLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            cancelText.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            cancelText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            deleteBtn.bottomAnchor.constraint(equalTo: cancelText.topAnchor, constant: -30),
            deleteBtn.heightAnchor.constraint(equalToConstant: 50),
            deleteBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            deleteBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            deleteBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
        ])
        
        //Size to fix label
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.sizeToFit()
        
        descriptionLabel.font = descriptionLabel.font.withSize(18)
        descriptionLabel.sizeToFit()
        
        cancelText.font = UIFont(name: "SVN-Gilroy-SemiBold", size: 16)
        cancelText.sizeToFit()
  
    }
    
    
    //MARK: Overide Init
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
    
       
        addSubviews()
        loadContent()
        addLayout()
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      
    }
    
    override func layoutSubviews() {
        
        let startColor = CGColor(red: 0.439, green: 0.71, blue: 0.341, alpha: 1)
        let endColor = CGColor(red: 0.056, green: 0.558, blue: 0.317, alpha: 1)
        
        deleteBtn.setGradientBackground(colors: [startColor,endColor])

    }
    
    func loadContent() {
        
        label.text = deleteAllModel.label
        descriptionLabel.text = deleteAllModel.description
        deleteBtn.setTitle(deleteAllModel.buttonText, for: .normal)
        cancelText.text = deleteAllModel.cancelText
        
    }

}
