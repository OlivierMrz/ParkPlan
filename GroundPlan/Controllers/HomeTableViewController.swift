//
//  HomeTableViewController.swift
//  GroundPlan
//
//  Created by Olivier Miserez on 12/03/2018.
//  Copyright © 2018 GhostApps. All rights reserved.
//

import UIKit


class HomeTableViewController: UITableViewController{
    
    
var parks = [Park]()
    
let cellBgColors = [ColorPalette.yellow, ColorPalette.green, ColorPalette.red]

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = ColorPalette.grey
        self.navigationController?.navigationBar.tintColor = ColorPalette.blue
        self.navigationController!.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: ColorPalette.blue]
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Alert message
        //        UserDefaults.standard.set(false, forKey: "neverShowMessageAgain")

        
        
        let favorites = Park(firstline: "Take me to my", secondline: "favorites")
        parks.append(favorites)
        
        let zoo = Park(firstline: "Take me to a", secondline: "zoo")
        parks.append(zoo)
        
        let themepark = Park(firstline: "Take me to a", secondline: "themepark")
        parks.append(themepark)
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return parks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "parkCell", for: indexPath) as! HomeTableViewCell

        
        
        let bgColor = cellBgColors[indexPath.row]
        cell.contentView.backgroundColor = bgColor

        cell.firstLineLabel.text = parks[indexPath.row].firstline
        cell.secondLineLabel.text = parks[indexPath.row].secondline.uppercased()
        
        cell.firstLineLabel.centerYAnchor.constraint(equalTo: cell.centerYAnchor, constant: -22.5).isActive = true
        
        if(indexPath.row == 0){
            cell.selectionStyle = .none;
            cell.isUserInteractionEnabled = false
            
            cell.firstLineLabel.isEnabled = false
            cell.secondLineLabel.isEnabled = false
        } else{
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "zooOrThemeSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ParkTableViewController {
            
            destination.parks = parks[(self.tableView.indexPathForSelectedRow?.row)!]
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }

    
}
