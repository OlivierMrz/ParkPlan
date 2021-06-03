//
//  GroundplanController.swift
//  GroundPlan
//
//  Created by Olivier Miserez on 12/03/2018.
//  Copyright © 2018 GhostApps. All rights reserved.
//

import UIKit

class GroundplanController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: Setup image for selected park
        checkIfImage()

        // MARK: ScrollView Image
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 6.0
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }

    //MARK: Func Setup image for selected park
    func checkIfImage() {
        let currentP = (UserDefaults.standard.object(forKey: "selectedPark") as? String)!
        let img = UIImage(named: "\(currentP)-grondplan")
        imageView.image = img

        let image : UIImage? = img

        if image != nil {
            // if there is an image
            
        } else {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width-40, height: 60))
            label.center = CGPoint(x: view.frame.width/2, y: view.frame.height/2-60)
            label.textAlignment = .center
            label.text = "Sorry, no plan available."
            label.backgroundColor = ColorPalette.disabled
            label.textColor = ColorPalette.grey
            
            label.layer.shadowColor = UIColor.black.cgColor
            label.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
            
            label.layer.shadowRadius = 5.0
            label.layer.shadowOpacity = 0.5
            
            
            label.clipsToBounds = true
            label.layer.masksToBounds = false
            self.view.addSubview(label)
        }
    }
}
