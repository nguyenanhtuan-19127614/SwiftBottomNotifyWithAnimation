//
//  PermissionData.swift
//  NotifyProj
//
//  Created by Wee on 22/08/2022.
//

import Foundation
import UIKit

struct PermissionSection {
    
    var iconImage: UIImage?
    var sectionLabel: String
    
}

struct PermissionModel {
    
    let label: String = "How to give app permission to access your microphone and camera"
    
    let contents: [[String]] = [
        
        [
            "1. Select “Settings” on your device.",
            "2. Scroll down and select “FE Online” from list.",
            "3. Under “Allow FE Online to access”, turn on  “Microphone” and “Camera”."
        ],
        
        [
            "1. Select “Settings” on your device.",
            "2. Scroll down and select “FE Online” from list.",
            "3. Under “Allow FE Online to access”, turn on  “Microphone” and “Camera”."
        ]
    
    ]
    
    let section: [PermissionSection] = [
        
        PermissionSection(iconImage: UIImage(named: "iOS") ?? nil,
                          sectionLabel: "iOS user:") ,
        PermissionSection(iconImage: UIImage(named: "android") ?? nil,
                          sectionLabel: "Android user:")
        
    ]
}
