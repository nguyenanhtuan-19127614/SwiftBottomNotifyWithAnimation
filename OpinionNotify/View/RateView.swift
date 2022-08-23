//
//  RateView.swift
//  NotifyProj
//
//  Created by Wee on 22/08/2022.
//

import Foundation
import UIKit

class RateView: UIView {
    
    let defaultStar = UIImage(named: "star")
    let ratedStar = UIImage(named: "star")?.withTintColor(.yellow)
    var selectedStar = -1
    
    var contentDelegate: OpinionContentView?
    
    let starView1: UIImageView = {
        
        let imageView = UIImageView()
        return imageView
        
    }()
    
    let starView2: UIImageView = {
        
        let imageView = UIImageView()
        return imageView
        
    }()
    
    let starView3: UIImageView = {
        
        let imageView = UIImageView()
        return imageView
        
    }()
    
    let starView4: UIImageView = {
        
        let imageView = UIImageView()
        return imageView
        
    }()
    
    let starView5: UIImageView = {
        
        let imageView = UIImageView()
        return imageView
        
    }()
    
    var starContainer: [UIImageView]?
    
    func addSubviews() {
        
        self.starContainer = [starView1, starView2, starView3, starView4, starView5]
        
        self.addSubview(starView1)
        self.addSubview(starView2)
        self.addSubview(starView3)
        self.addSubview(starView4)
        self.addSubview(starView5)
    }
    
    func setImages() {
        
        starView1.image = defaultStar
        starView2.image = defaultStar
        starView3.image = defaultStar
        starView4.image = defaultStar
        starView5.image = defaultStar
        
    }
    
    func addLayout() {
        
        starView1.translatesAutoresizingMaskIntoConstraints = false
        starView2.translatesAutoresizingMaskIntoConstraints = false
        starView3.translatesAutoresizingMaskIntoConstraints = false
        starView4.translatesAutoresizingMaskIntoConstraints = false
        starView5.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            starView3.heightAnchor.constraint(equalTo: self.heightAnchor),
            starView3.widthAnchor.constraint(equalTo: self.heightAnchor),
            starView3.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            starView2.heightAnchor.constraint(equalTo: self.heightAnchor),
            starView2.widthAnchor.constraint(equalTo: self.heightAnchor),
            starView2.trailingAnchor.constraint(equalTo: starView3.leadingAnchor, constant: -15),
            
            starView4.heightAnchor.constraint(equalTo: self.heightAnchor),
            starView4.widthAnchor.constraint(equalTo: self.heightAnchor),
            starView4.leadingAnchor.constraint(equalTo: starView3.trailingAnchor, constant: 15),
            
            starView1.heightAnchor.constraint(equalTo: self.heightAnchor),
            starView1.widthAnchor.constraint(equalTo: self.heightAnchor),
            starView1.trailingAnchor.constraint(equalTo: starView2.leadingAnchor, constant: -15),
            
            starView5.heightAnchor.constraint(equalTo: self.heightAnchor),
            starView5.widthAnchor.constraint(equalTo: self.heightAnchor),
            starView5.leadingAnchor.constraint(equalTo: starView4.trailingAnchor, constant: 15),
        
        ])
        
    }
    
    //MARK: Overide Init
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        
        setImages()
        setupGesture()
        addSubviews()
        addLayout()
     
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      
    }
    
    func setupGesture() {
        
        //Create Gesture
        let star1Tap = UITapGestureRecognizer(target: self, action: #selector(self.starView1Tap(_:)))
        let star2Tap = UITapGestureRecognizer(target: self, action: #selector(self.starView2Tap(_:)))
        let star3Tap = UITapGestureRecognizer(target: self, action: #selector(self.starView3Tap(_:)))
        let star4Tap = UITapGestureRecognizer(target: self, action: #selector(self.starView4Tap(_:)))
        let star5Tap = UITapGestureRecognizer(target: self, action: #selector(self.starView5Tap(_:)))

        //Add gesture to view
        starView1.addGestureRecognizer(star1Tap)
        starView2.addGestureRecognizer(star2Tap)
        starView3.addGestureRecognizer(star3Tap)
        starView4.addGestureRecognizer(star4Tap)
        starView5.addGestureRecognizer(star5Tap)

        //Set interactable view
        starView1.isUserInteractionEnabled = true
        starView2.isUserInteractionEnabled = true
        starView3.isUserInteractionEnabled = true
        starView4.isUserInteractionEnabled = true
        starView5.isUserInteractionEnabled = true
    }
    
    func setupDelegate(view: OpinionContentView) {
        self.contentDelegate = view
    }
    
//    func ratingHandler(recursionCount: Int = 0,index: Int) {
//
//        print(index)
//        guard let starContainer = starContainer else {
//            return
//        }
//
//        if index>starContainer.count-1 {
//            return
//        }
//
//        if recursionCount>starContainer.count-1 {
//            return
//        }
//
//        UIView.transition(with: self, duration: 0.2, options: .transitionCrossDissolve,
//                          animations: {
//
//            if recursionCount<=index {
//
//                //turn on star
//                starContainer[recursionCount].image = self.ratedStar
//
//            } else {
//
//                //turn off star
//                starContainer[recursionCount].image = self.defaultStar
//
//            }
//
//        }) {
//            _ in
//            self.ratingHandler(recursionCount: recursionCount+1, index: index)
//        }
//
//
//    }
//

    func ratingHandler(index: Int) {

        guard let starContainer = starContainer else {
            return
        }

        if index>starContainer.count-1 || index == selectedStar {
            return
        }
        
        //first touch
        if selectedStar == -1 {
            selectedStar = 0
            UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve,
                              animations: {

                //turn on star
                starContainer[0].image = self.ratedStar


            }, completion: nil)
        }

        
        if index >= selectedStar {

            for i in selectedStar...index {

                UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve,
                                  animations: {

                    //turn on star
                    starContainer[i].image = self.ratedStar


                }, completion: nil)

            }

        }

        if index < selectedStar {

            //reverse loop
            for i in stride(from: selectedStar, to: index, by: -1) {

                UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve,
                                  animations: {

                    //turn off star
                    starContainer[i].image = self.defaultStar

                }, completion: nil)

            }

        }

        //Delegate turn on/ off submit butotn
        selectedStar = index
        
        if selectedStar >= starContainer.count/2 {
            
            contentDelegate?.turnOnSubmitButton(numberStars: selectedStar+1)
            
        } else {
            
            contentDelegate?.turnOffSubmitButton(numberStars: selectedStar+1)
            
        }
        
    }
    
  
    
    @objc func starView1Tap(_ sender: UITapGestureRecognizer) {
        
        ratingHandler(index: 0)
        
    }
    @objc func starView2Tap(_ sender: UITapGestureRecognizer) {
        ratingHandler(index: 1)
    }
    @objc func starView3Tap(_ sender: UITapGestureRecognizer) {
        ratingHandler(index: 2)
    }
    @objc func starView4Tap(_ sender: UITapGestureRecognizer) {
        ratingHandler(index: 3)
    }
    @objc func starView5Tap(_ sender: UITapGestureRecognizer) {
        ratingHandler(index: 4)
    }
}
