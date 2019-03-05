//
//  ZooTableViewController.swift
//  GroundPlan
//
//  Created by Olivier Miserez on 12/03/2018.
//  Copyright © 2018 GhostApps. All rights reserved.
//

import UIKit
import CoreData

class ParkTableViewController: UITableViewController {

    var isHome = false
    var parks:Park?
    
    var favorites : [NSString] = [NSString]()
    
    var subZooParks = ["bellewaerde", "bouwdewijn-seapark", "harrymalter", "mondesauvage", "olmensezoo", "pairidaiza", "planckendeal", "zoo-antwerpen", "sealife", "serpentarium", "zonnegloed"]
    var subThemeParks = ["bellewaerde", "bobbejaanland", "bouwdewijn-seapark", "harrymalter", "plopsacoo", "plopsaindoor", "plopsaland", "walibi"]
    
    let cellSpacingHeight: CGFloat = 50
    
    var isAddedZoo:Bool = false
    var isAddedTheme:Bool = false
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.barTintColor = ColorPalette.grey
        self.navigationController?.navigationBar.tintColor = ColorPalette.blue
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: ColorPalette.blue]
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpNavBar()
        
        UserDefaults.standard.set((parks?.secondline)!, forKey: "parkType")
        
        self.title = (parks?.secondline)!.capitalized
        print("--------")
        print("Type of ",(parks?.secondline)!)
        print("--------")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    func setUpNavBar(){
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        navigationController?.hidesBarsOnSwipe = false
    }
    
    
    // MARK: - Table view swipe action
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favorites = favoritesAction(at: indexPath)
        return UISwipeActionsConfiguration(actions: [favorites])
    }
    
    func favoritesAction(at IndexPath: IndexPath) -> UIContextualAction {
        
        
        let action = UIContextualAction(style: .normal, title: "", handler: { (action, view, completion) in
            completion(true)
            
            if (self.parks?.secondline)! == "favorites" {
                let test = self.favorites[IndexPath.row]
                
                print(test,"is added to your favorites")
                
            } else if (self.parks?.secondline)! == "zoo" {
                let currentPark = self.subZooParks[IndexPath.row].capitalized
                
                
                if self.isAddedZoo{
                    self.isAddedZoo = false
                    
                    
                    self.alertFavorites(title: "", message: "\(currentPark) is deleted to your favorites")
                    print(currentPark,"is deleted to your favorites")
                    
                    
                } else {
                    self.isAddedZoo = true
                    

                    self.alertFavorites(title: "", message: "\(currentPark) is added to your favorites")
                    print(currentPark,"is added to your favorites")
                }
                
                
            } else if (self.parks?.secondline)! == "themepark" {
                let currentPark = self.subThemeParks[IndexPath.row].capitalized
                
                if self.isAddedTheme{
                    self.isAddedTheme = false
                    self.alertFavorites(title: "", message: "\(currentPark) is deleted to your favorites")
                    print(currentPark,"is deleted to your favorites")
                } else {
                    self.isAddedTheme = true
                    self.alertFavorites(title: "", message: "\(currentPark) is added to your favorites")
                    print(currentPark,"is added to your favorites")
                }
                
            }
            
            
        })
        
        if isAddedZoo || isAddedTheme{
            action.image = #imageLiteral(resourceName: "favoritesSelectedBtn")
        } else {
            action.image = #imageLiteral(resourceName: "favoritesBtn")
        }
        
        
        
        action.backgroundColor = ColorPalette.yellow
        
        return action
    }

    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        var currentPark: Int!
        if (parks?.secondline)! == "favorites" {
            currentPark = favorites.count
        } else if (parks?.secondline)! == "zoo" {
            currentPark = subZooParks.count
        } else if (parks?.secondline)! == "themepark" {
            currentPark = subThemeParks.count
        }
        return currentPark
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subParkCell", for: indexPath) as! SubParkTableViewCell
        
        if (parks?.secondline)! == "zoo" {
//            print("zoo")
            let sortedSubZooParks = subZooParks.sorted()
            cell.subParkLabel.text = sortedSubZooParks[indexPath.row].capitalized
            
            if (indexPath.row % 2 == 0){
                cell.contentView.backgroundColor = ColorPalette.green
            } else {
                cell.contentView.backgroundColor = ColorPalette.opacityGreen
            }
            
            
        } else if (parks?.secondline)! == "themepark" {
//            print("themepark")

            let sortedSubThemeParks = subThemeParks.sorted()
            cell.subParkLabel.text = sortedSubThemeParks[indexPath.row].capitalized
            if (indexPath.row % 2 == 0){
                cell.contentView.backgroundColor = ColorPalette.red
            } else {
                cell.contentView.backgroundColor = ColorPalette.opacityRed
            }
            
        } else if (parks?.secondline)! == "favorites" {
            //            print("themepark")
            cell.subParkLabel.text = favorites[indexPath.row].capitalized
            if (indexPath.row % 2 == 0){
                cell.contentView.backgroundColor = ColorPalette.yellow
            } else {
                cell.contentView.backgroundColor = ColorPalette.yellow
            }
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "selectedParkSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? TabBarController {
        
            if (parks?.secondline)! == "zoo" {
                destination.currentPark = subZooParks[(self.tableView.indexPathForSelectedRow?.row)!]
            } else if (parks?.secondline)! == "themepark" {
                destination.currentPark = subThemeParks[(self.tableView.indexPathForSelectedRow?.row)!]
            } else if (parks?.secondline)! == "favorites" {
                destination.currentPark = favorites[(self.tableView.indexPathForSelectedRow?.row)!] as String
            }
        
            
        }
    }
    
    
    
    // CreateAlert Messages
    func alertSwipeCell (title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // Creating button
        alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            UserDefaults.standard.set(false, forKey: "neverShowMessageAgain")
            
        }))
        
        alert.addAction(UIAlertAction(title: "Got it, never show message again!", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            UserDefaults.standard.set(true, forKey: "neverShowMessageAgain")
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    func alertFavorites (title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // Creating button
        alert.addAction(UIAlertAction(title: "Got it!", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    

}
