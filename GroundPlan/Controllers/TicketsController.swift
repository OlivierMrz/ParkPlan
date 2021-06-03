//
//  TicketsController.swift
//  GroundPlan
//
//  Created by Olivier school on 12/03/2018.
//  Copyright © 2018 Miserez. All rights reserved.
//

import UIKit
import SafariServices

class TicketsController: UIViewController {
    // MARK: labels
    @IBOutlet weak var ticketSubTitleLbl: UILabel!

    // MARK: Button
    @IBOutlet weak var btnTickets: CustomButton!

    // UserDefaults
    let currentP = UserDefaults.standard.object(forKey: "selectedPark")
    let currentParkType = (UserDefaults.standard.object(forKey: "parkType") as? String)!

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: Set BackgroundColor for btnShowRoute
        if currentParkType == "zoo" {
            btnTickets.backgroundColor = ColorPalette.green
        } else if currentParkType == "themepark" {
            btnTickets.backgroundColor = ColorPalette.red
        } else {
            btnTickets.backgroundColor = .white
        }

        // MARk: Set btnShowRoute text
        btnTickets.setTitle("Buy tickets", for: .normal)

    }

    // button actions
    @IBAction func btnTickets(_ sender: Any) {
        let containerVC = UIViewController()
        let url = URL(string: "https://www.google.be")!
        let safariVC = SFSafariViewController(url: url)
        containerVC.addChildViewController(safariVC)
        safariVC.view.autoresizingMask = [ .flexibleWidth, .flexibleHeight ]
        safariVC.view.frame = containerVC.view.frame
        containerVC.view.addSubview(safariVC.view)
        safariVC.didMove(toParentViewController: containerVC)
        self.present(containerVC, animated: true, completion: nil)
    }
}
