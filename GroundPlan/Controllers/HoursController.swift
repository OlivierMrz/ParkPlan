//
//  HoursController.swift
//  GroundPlan
//
//  Created by Olivier Miserez on 12/03/2018.
//  Copyright © 2018 GhostApps. All rights reserved.
//

import UIKit
import SafariServices

class HoursController: UIViewController {
    // Titels
    @IBOutlet weak var openingHoursTitleLbl: UILabel!
    @IBOutlet weak var addressTitleLbl: UILabel!

    // Days of the week
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    @IBOutlet weak var thursdayLabel: UILabel!
    @IBOutlet weak var fridayLabel: UILabel!
    @IBOutlet weak var saterdayLabel: UILabel!
    @IBOutlet weak var sundayLabel: UILabel!

    // Hours of the week
    @IBOutlet weak var mondayHoursLabel: UILabel!
    @IBOutlet weak var tuesdayHourslabel: UILabel!
    @IBOutlet weak var wednesdayHoursLabel: UILabel!
    @IBOutlet weak var thursdayHoursLabel: UILabel!
    @IBOutlet weak var fridayHoursLabel: UILabel!
    @IBOutlet weak var saterdayHoursLabel: UILabel!
    @IBOutlet weak var sundayHoursLabel: UILabel!

    // AddressLines
    @IBOutlet weak var parkAddressLbl: UILabel!

    // Buttons
    @IBOutlet weak var btnShowRoute: CustomButton!

    // UserDefaults
    let currentP = UserDefaults.standard.object(forKey: "selectedPark")
    let currentParkType = (UserDefaults.standard.object(forKey: "parkType") as? String)!

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: Set BackgroundColor for btnShowRoute
        if currentParkType == "zoo" {
            btnShowRoute.backgroundColor = ColorPalette.green
        } else if currentParkType == "themepark" {
            btnShowRoute.backgroundColor = ColorPalette.red
        } else {
            btnShowRoute.backgroundColor = .white
        }

        // MARk: Set btnShowRoute text
        btnShowRoute.setTitle("Show route", for: .normal)
    }

    // Button SHOW ROUTE
    @IBAction func btnShowRoute(_ sender: Any) {
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
