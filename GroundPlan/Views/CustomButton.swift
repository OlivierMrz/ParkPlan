//
//  CustomButton.swift
//  GroundPlan
//
//  Created by Olivier Miserez on 14/03/2018.
//  Copyright © 2018 GhostApps. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    

//    let corner_radius : CGFloat =  4.0
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        // MARK: Shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.5

        
        self.clipsToBounds = true
        self.layer.masksToBounds = false




    }

}
