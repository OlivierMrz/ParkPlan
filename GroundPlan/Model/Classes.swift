
//  Created by Olivier Miserez on 12/03/2018.
//  Copyright © 2018 GhostApps. All rights reserved.
//

import UIKit


enum ColorPalette {
    static let blue =  UIColor(red:0.173, green: 0.243, blue: 0.314, alpha: 1.000)
    static let green =  UIColor(red:0.476, green: 0.917, blue: 0.702, alpha: 1.000)
    static let opacityGreen =  UIColor(red:0.476, green: 0.917, blue: 0.702, alpha: 0.700)
    static let yellow =  UIColor(red:1.000, green: 0.970, blue: 0.599, alpha: 1.000)
    static let red =  UIColor(red:1.000, green: 0.544, blue: 0.544, alpha: 0.900)
    static let opacityRed =  UIColor(red:1.000, green: 0.544, blue: 0.544, alpha: 0.700)
    static let grey =  UIColor(red:0.933, green: 0.933, blue: 0.933, alpha: 1.000)
    static let disabled =  UIColor(red:0.535, green: 0.535, blue: 0.535, alpha: 1.000)
}

class Park {
    var firstline: String
    var secondline: String
    var isFavorite: Bool

    init(firstline: String, secondline: String) {
        self.firstline = firstline
        self.secondline = secondline
        self.isFavorite = false
    }
}

class favoPark {
    var parkType: String
    var park: String

    init(parkType: String, park: String) {
        self.parkType = parkType
        self.park = park
    }
}

func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor{
    let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
    let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
    let blue = CGFloat(rgbValue & 0xFF)/256.0
    
    return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
}
