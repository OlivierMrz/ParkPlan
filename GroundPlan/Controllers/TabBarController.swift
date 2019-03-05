//
//  TabBarController.swift
//  GroundPlan
//
//  Created by Olivier Miserez on 12/03/2018.
//  Copyright © 2018 GhostApps. All rights reserved.
//

import UIKit
import CoreData


class TabBarController: UITabBarController {
    
    var currentPark:String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Storing UserDefaults
        UserDefaults.standard.set(currentPark, forKey: "selectedPark")
        let currentP = (UserDefaults.standard.object(forKey: "selectedPark") as? String)!
        let currentParkType = (UserDefaults.standard.object(forKey: "parkType") as? String)!
        
        print(currentP)
        
        // MARK: TabBar customization
        if currentParkType == "favorites" {
            self.tabBar.barTintColor = ColorPalette.yellow
        } else if currentParkType == "zoo" {
            self.tabBar.barTintColor = ColorPalette.green
        } else if currentParkType == "themepark" {
            self.tabBar.barTintColor = ColorPalette.red
        } else {
            self.tabBar.barTintColor = ColorPalette.grey
        }
        


        self.tabBar.tintColor = ColorPalette.blue // active Color selected
        self.tabBar.unselectedItemTintColor = ColorPalette.blue // not active Color

        
        
        
        
        // MARK: Navigation customization
        navigationController?.hidesBarsOnSwipe = false

        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationItem.title = "\(currentP.capitalized)"
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        let currentParkType = (UserDefaults.standard.object(forKey: "parkType") as? String)!
         print(currentParkType)
        
        if currentParkType == "favorites" {
            self.navigationController?.navigationBar.barTintColor = ColorPalette.yellow
        } else if currentParkType == "zoo" {
            self.navigationController?.navigationBar.barTintColor = ColorPalette.green
        } else if currentParkType == "themepark" {
            self.navigationController?.navigationBar.barTintColor = ColorPalette.red
        } else {
            self.navigationController?.navigationBar.barTintColor = ColorPalette.grey
        }
        
        self.navigationController?.navigationBar.tintColor = ColorPalette.blue
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: ColorPalette.blue]
    }
    
    
    
}
