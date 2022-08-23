//
//  ViewController.swift
//  NotifyProj
//
//  Created by Wee on 22/08/2022.
//

import UIKit

class ViewController: UIViewController {

    //Define Var
    let permissionBtn: UIButton =  {
        
        let button = UIButton()
        button.setTitle("Permission", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        
        return button
        
        
    }()
    
    let opinionBtn: UIButton =  {
        
        let button = UIButton()
        button.setTitle("Opinion", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        
        return button
        
        
    }()
    
    let deleteAllBtn: UIButton = {
        
        let button = UIButton()
        button.setTitle("Delete All", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 3
        
        return button
        
    }()
    
    //Add subview
    func addSubviews() {
        
        self.view.addSubview(permissionBtn)
        self.view.addSubview(opinionBtn)
        self.view.addSubview(deleteAllBtn)
        
    }
    //Add layout for subviews
    func addLayout() {
        
        permissionBtn.translatesAutoresizingMaskIntoConstraints = false
        opinionBtn.translatesAutoresizingMaskIntoConstraints = false
        deleteAllBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            permissionBtn.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            permissionBtn.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            permissionBtn.widthAnchor.constraint(equalToConstant: 150),
            permissionBtn.heightAnchor.constraint(equalToConstant: 50),
            
            opinionBtn.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            opinionBtn.topAnchor.constraint(equalTo: permissionBtn.bottomAnchor, constant: 20),
            opinionBtn.widthAnchor.constraint(equalToConstant: 150),
            opinionBtn.heightAnchor.constraint(equalToConstant: 50),
            
            deleteAllBtn.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            deleteAllBtn.bottomAnchor.constraint(equalTo: permissionBtn.topAnchor, constant: -20),
            deleteAllBtn.widthAnchor.constraint(equalToConstant: 150),
            deleteAllBtn.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
    }
    
    //ViewDidLoad State
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        addSubviews()
        addLayout()
        
        permissionBtn.addTarget(self, action: #selector(presentPermissionNotify), for: .touchUpInside)
        opinionBtn.addTarget(self, action: #selector(presentOpinionNotify), for: .touchUpInside)
        deleteAllBtn.addTarget(self, action: #selector(presentDeleteAllNotify), for: .touchUpInside)
    }
    
   
    
    @objc func presentPermissionNotify() {
        
        let permissionNotify = NotifyVC()
        permissionNotify.setupContentType(type: .permission)
        permissionNotify.modalPresentationStyle = .overCurrentContext
        self.present(permissionNotify, animated: false)
        
    }
    
    @objc func presentOpinionNotify() {
        
        let opinionNotify = NotifyVC()
        opinionNotify.setupContentType(type: .opinion)
        opinionNotify.modalPresentationStyle = .overCurrentContext
        self.present(opinionNotify, animated: false)
        
    }

    @objc func presentDeleteAllNotify() {
        
        let deleteAllNotify = NotifyVC()
        deleteAllNotify.setupContentType(type: .delete)
        deleteAllNotify.modalPresentationStyle = .overCurrentContext
        self.present(deleteAllNotify, animated:  false)
        
    }
}

