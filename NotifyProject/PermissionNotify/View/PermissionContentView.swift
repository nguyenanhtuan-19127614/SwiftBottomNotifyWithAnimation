//
//  PermissionContentView.swift
//  NotifyProj
//
//  Created by Wee on 22/08/2022.
//

import Foundation
import UIKit

class PermissionContentView: UIView {
    
    let permissionModel = PermissionModel()
    
    //Permission Icon
    let iconImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image  = UIImage(named: "notifyIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    //Permission Label
    let label: UILabel = {
        
        let label = UILabel()
        label.text = PermissionModel().label
        label.textColor = UIColor(red: 0.098, green: 0.098, blue: 0.098, alpha: 1)
       
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
        
    }()
    
    //Guide Collection
    let guideColletionLayout = UICollectionViewFlowLayout()
    let guideColletion: UICollectionView = {
        
        let guideCollection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        guideCollection.backgroundColor = .white
        
        //register Cell
        guideCollection.register(GuideCell.self, forCellWithReuseIdentifier: "GuideCell")
        //register Section
        guideCollection.register(GuideSection.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "GuideSection")
             
        return guideCollection
        
    }()
    
    //Setting Button
    let settingBtn: UIButton = {
        
        let btn = UIButton()
        btn.setTitle("GO TO SETTINGS", for: .normal)
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true

        return btn
        
    }()
    
    //Add subview
    func addSubviews() {
        
        self.addSubview(iconImage)
        self.addSubview(label)
        
        //Collection
        guideColletionLayout.minimumLineSpacing = 20
    
        guideColletion.collectionViewLayout = guideColletionLayout
        guideColletion.delegate = self
        guideColletion.dataSource = self
        
        self.addSubview(guideColletion)
        self.addSubview(settingBtn)
        
    }
    
    //Add Layout
    func addLayout() {
        
       
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        guideColletion.translatesAutoresizingMaskIntoConstraints = false
        settingBtn.translatesAutoresizingMaskIntoConstraints = false
      
        
        NSLayoutConstraint.activate([
            
            iconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            iconImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            iconImage.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/5),
            iconImage.heightAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/5),
            
            label.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 25),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            guideColletion.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            guideColletion.heightAnchor.constraint(equalToConstant: 400),
            guideColletion.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            guideColletion.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            settingBtn.topAnchor.constraint(equalTo: guideColletion.bottomAnchor),
            settingBtn.heightAnchor.constraint(equalToConstant: 50),
            settingBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            settingBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            settingBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
        ])
        
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.sizeToFit()
    }
    
    
    //MARK: Overide Init
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
  
        addSubviews()
        addLayout()
        
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      
    }
    
    override func layoutSubviews() {
        
        let startColor = CGColor(red: 0.439, green: 0.71, blue: 0.341, alpha: 1)
        let endColor = CGColor(red: 0.056, green: 0.558, blue: 0.317, alpha: 1)
        
        settingBtn.setGradientBackground(colors: [startColor,endColor])

    }
  
}

extension PermissionContentView: UICollectionViewDelegate {
    
}

extension PermissionContentView: UICollectionViewDataSource {
    
    //Section Number
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return permissionModel.section.count
        
    }
    
    //Cell for each Section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return permissionModel.contents[section].count
        
    }
    
    //Return cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let guideCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GuideCell", for: indexPath) as? GuideCell else {

                   return UICollectionViewCell()
                   
        }
               
        guideCell.loadData(label: permissionModel.contents[indexPath.section][indexPath.row])
        return guideCell
        
    }
    
    //Return Section
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let guideSection = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "GuideSection", for: indexPath) as? GuideSection else {
            
            return UICollectionReusableView()
                       
        }
                   
        let image = permissionModel.section[indexPath.section].iconImage
        let label = permissionModel.section[indexPath.section].sectionLabel
        guideSection.loadData(image: image, label: label)
        return guideSection
        
    }
           
    
}

extension PermissionContentView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         
        let totalWidth = collectionView.frame.width
        
        //Dynamic Height
        let contentLabel = UILabel()
        contentLabel.text = permissionModel.contents[indexPath.section][indexPath.row]
        contentLabel.font = contentLabel.font.withSize(18)
        let height = contentLabel.calculateHeight(frame: CGRect(x: 0,
                                                                y: 0,
                                                                width: totalWidth,
                                                                height: 0))
 
        return CGSize(width: totalWidth,
                      height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
           
        let totalWidth = collectionView.frame.width
        let totalHeight = collectionView.frame.height
        return CGSize(width: totalWidth,
                              height: totalHeight/10)
        
    }
}
