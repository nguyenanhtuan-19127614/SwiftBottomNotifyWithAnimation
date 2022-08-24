

import Foundation
import UIKit

class NotifyVC: UIViewController {
    
    let maximumContainerHeight: CGFloat = 700
    var defaultHeight: CGFloat = 700
    let defaultAlpha = 0.6
    var dismissibleHeight : CGFloat = 200
    var currentContainerHeight: CGFloat = 0
 
    
    //Define Variable
    //Dimmed View
    let dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.6
       
        return view
    }()
    
    //Content View
    var contentView = UIView()
   
    //Dynamic container constraint
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    //Add subview
    func addSubviews() {
        
        self.view.addSubview(dimmedView)
        self.view.addSubview(contentView)
       
    }
    //Add Layout
    func addLayout() {
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
      
        NSLayoutConstraint.activate([
            
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
          
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
      
        containerViewHeightConstraint = contentView.heightAnchor.constraint(equalToConstant: defaultHeight)
 
        containerViewBottomConstraint = contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
        
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
    }
    
    func setupContentType(type: NotifyType) {
        
        switch type {
            
        case .permission:
            
            contentView = PermissionContentView()
            defaultHeight = 700
            currentContainerHeight = defaultHeight
            
        case .opinion:
            
            contentView = OpinionContentView()
            defaultHeight = 600
            currentContainerHeight = defaultHeight
            
        case .delete:
            
            contentView = DeleteAllContentView()
            defaultHeight = 450
            currentContainerHeight = defaultHeight
            
        }
        
    }
    
    //ViewDidLoad State
    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .clear

        addSubviews()
        addLayout()
        setupPanGesture()
       
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.dismissNotify(_:)))
        dimmedView.addGestureRecognizer(gesture)
        
        dismissibleHeight = self.view.bounds.height/2
        
        //Key board show noti
        NotificationCenter.default.addObserver(self, selector: #selector(NotifyVC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        //Key board hide noti
        NotificationCenter.default.addObserver(self, selector: #selector(NotifyVC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
          
    }
    
    // keyboard show animation
    @objc func keyboardWillShow(notification: NSNotification) {
            
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
          
           return
        }
    
      self.view.frame.origin.y = 0 - (keyboardSize.height - 20)
    }
    
    //keyboard hide animaition
    @objc func keyboardWillHide(notification: NSNotification) {
      self.view.frame.origin.y = 0
    }
    
    //ViewDidAppear State()
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(false)
        animateShowDimmedView()
        animatePresentContainer()
        
    }
    

    //Pan Gesture
    func setupPanGesture() {
        // add pan gesture recognizer to the view controller's view (the whole screen)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gesture:)))
        // change to false to immediately listen on gesture movement
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        
        let isDraggingDown = translation.y > 0
        
        //New height based on drag value
        let newHeight = currentContainerHeight - translation.y
        
        switch gesture.state {
            
        case .changed:
            
        
            if newHeight < maximumContainerHeight && newHeight > 200 {
                
                containerViewHeightConstraint?.constant = newHeight
                    
                view.layoutIfNeeded()
               
            }
            
        case .ended:
            if newHeight < dismissibleHeight {
                //If new height belew dismiss point, dismiss notify
                self.dismissNotify()
            }
            else if newHeight < defaultHeight {
                //  If new height is below default, animate back to default
                animateContainerHeight(defaultHeight)
            }
            else if newHeight < maximumContainerHeight && isDraggingDown {
                // If new height is below max and going down, set to default height
                animateContainerHeight(defaultHeight)
            }
            else if newHeight > defaultHeight && !isDraggingDown {
                // If new height is below max and going up, set to max height at top
                animateContainerHeight(maximumContainerHeight)
            }
            break
      
        case .possible:
            break
        case .began:
            break
        case .cancelled:
            break
        case .failed:
            break
        @unknown default:
            break
        }
    }
    
    //Animation gusture action
    func animateContainerHeight(_ height: CGFloat) {
        UIView.animate(withDuration: 0.4) {
            // Update container height
            self.containerViewHeightConstraint?.constant = height
            // Call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
        // Save current height
        currentContainerHeight = height
    }
  
    
    //Animation when dismiss
    func dismissNotify() {
        UIView.animate(withDuration: 0.4) {
           
            
            [weak self] in
            guard let self = self else {
                return
            }
            self.containerViewBottomConstraint?.constant = self.currentContainerHeight
            // call this to trigger refresh constraint
            self.view.layoutIfNeeded()
            
            self.dimmedView.alpha = 0
            
        } completion: { _ in
            
            self.dismiss(animated: false)
        }
       
        
    }
    @objc func dismissNotify(_ sender:UITapGestureRecognizer) {
        
        self.dismissNotify()
     
    }
    
    //Animation when present
    func animateShowDimmedView() {
        dimmedView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = self.defaultAlpha
        }
    }
    func animatePresentContainer() {
     
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = 0
           
            self.view.layoutIfNeeded()
        }
    }
    
}


