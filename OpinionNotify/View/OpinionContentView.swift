//
//  OpinionContentView.swift
//  NotifyProj
//
//  Created by Wee on 22/08/2022.
//

import Foundation
import UIKit


class OpinionContentView: UIView {
    
    let opinionModel = OpinionModel()
    
    let commentPlaceHolder = "Add comment here"
    let commentStartRange = NSRange(location: 0, length: 0)
    let commentDefaultHeight: CGFloat = 130
    var commentCurrentHeight: CGFloat = 130
    
    //Dynamic comment height constraint
    var commentHeightConstraint: NSLayoutConstraint?
    
    //Opinion Icon
    let iconImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image  = UIImage(named: "opinionIcon")
        imageView.contentMode = .scaleToFill
       
        return imageView
        
    }()
    
    //Opinion Label
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
       
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()
    
    //Rate View
    let rateView = RateView()
    
    //Comment Text Field
    let commentField: UITextView = {
        
        let textView = UITextView()
        textView.backgroundColor = .white
        
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1).cgColor
        textView.layer.cornerRadius = 6
        textView.layer.masksToBounds = true
        
        textView.font = UIFont.boldSystemFont(ofSize: 16)
        
        //padding
        textView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20)
       
        
        return textView
        
    }()
    
    //Submit Button
    let submitBtn: UIButton = {
       
        let btn = UIButton()
       
        btn.setTitleColor(UIColor.gray, for: .normal)
        
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
    
        btn.backgroundColor = UIColor(red: 0.965, green: 0.965, blue: 0.965, alpha: 1)
        
        return btn
        
    }()
    
    //Skip text
    let skipText: UILabel = {
        
        let textView = UILabel()
        textView.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
    
        return textView
        
    }()
    
    
    //Add subview
    func addSubviews() {
        
        self.addSubview(iconImage)
        self.addSubview(label)
        self.addSubview(descriptionLabel)
        self.addSubview(rateView)
        self.addSubview(commentField)
        self.addSubview(submitBtn)
        self.addSubview(skipText)
       
    }
    
    //Add Layout
    func addLayout() {
        
        //Active Contraint
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        rateView.translatesAutoresizingMaskIntoConstraints = false
        commentField.translatesAutoresizingMaskIntoConstraints = false
        submitBtn.translatesAutoresizingMaskIntoConstraints = false
        skipText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            iconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            iconImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            iconImage.widthAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4),
            iconImage.heightAnchor.constraint(equalTo: self.widthAnchor,multiplier: 1/4),
            
            label.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            
            descriptionLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            
            rateView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor,constant: 20),
            rateView.widthAnchor.constraint(equalTo: self.widthAnchor),
            rateView.heightAnchor.constraint(equalToConstant: 30),
            
            commentField.topAnchor.constraint(equalTo: rateView.bottomAnchor,constant: 23),
            commentField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            commentField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            
            submitBtn.topAnchor.constraint(equalTo: commentField.bottomAnchor,constant: 30),
            submitBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
            submitBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            submitBtn.heightAnchor.constraint(equalToConstant: 50),
            
            skipText.topAnchor.constraint(equalTo: submitBtn.bottomAnchor, constant: 20),
            skipText.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            
        ])
        
        //Set up dynamic height for comment view
        commentHeightConstraint = commentField.heightAnchor.constraint(equalToConstant: commentDefaultHeight)
        commentHeightConstraint?.isActive = true
        
        //Size to fix label
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.sizeToFit()
    
        descriptionLabel.sizeToFit()
        
        skipText.font = UIFont(name: "SVN-Gilroy-SemiBold", size: 16)
        skipText.sizeToFit()
        
    }
    
    
    //MARK: Overide Init
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
    
        setupCommentPlacholder()
        addSubviews()
        loadContent()
        addLayout()
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      
    }
    
    func setupCommentPlacholder() {
        
        //Set up placeholder for comment field
        commentField.text = commentPlaceHolder
        commentField.textColor = UIColor.lightGray
        commentField.delegate = self
        
    }
    
    func loadContent() {
        
        label.text = opinionModel.label
        submitBtn.setTitle(opinionModel.submitBtnText, for: .normal)
        skipText.text = opinionModel.skipText
        
        //HTML Atribute Description
        guard let descriptionData = opinionModel.description.data(using: .utf8) else {
            descriptionLabel.text = opinionModel.description
            return
        }
      
        guard let attributedDescription = try? NSMutableAttributedString(
            data: descriptionData,
            options: [.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil) else {
                
            descriptionLabel.text = opinionModel.description
            return
                
        }
     
        descriptionLabel.attributedText = attributedDescription
        descriptionLabel.textAlignment = .center
    }

}

extension OpinionContentView: UITextViewDelegate {

    
    func textViewDidChangeSelection(_ textView: UITextView) {
        
        if textView.text == commentPlaceHolder {
           
            if let selectedRange = textView.selectedTextRange {

                textView.font = UIFont.systemFont(ofSize: 16)
                // and only if the new position is valid
                if let newPosition = textView.position(from: selectedRange.start, offset: 0) {

                    // set the new position
                    textView.selectedTextRange = textView.textRange(from: newPosition, to: newPosition)
                    //clear placholder
                    textView.text = ""
                   
                    
                }
            }

        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        
        // Manages state of text when changed
        if textView.text.isEmpty {
            textView.text = commentPlaceHolder
            textView.textColor = .lightGray
        } else if textView.text != commentPlaceHolder {
            textView.textColor = .black
        }
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView.text.isEmpty {
            textView.text = commentPlaceHolder
            textView.textColor = .lightGray
        } else if textView.text != commentPlaceHolder {
            textView.textColor = .black
            
        }
        
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        // Called when you're trying to enter a character (to replace the placeholder)
        if textView.text == commentPlaceHolder {
            textView.text = ""
        }
        return true
        
    }
    
}
