//
//  MainNavigationController.swift
//  GroundPlan
//
//  Created by Olivier Miserez on 13/03/2018.
//  Copyright © 2018 GhostApps. All rights reserved.
//

import UIKit
import CoreData
class MainNavigationController: UINavigationController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setCustomBackImage() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "back-btn2")
        self.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "back-btn2")
        self.navigationBar.tintColor = UIColorFromHex(rgbValue: 0xA13232, alpha: 1)
        self.navigationBar.backItem?.title = "test"
    }
    

}
