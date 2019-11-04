//
//  UIColor+Utils.swift
//  Idezz
//
//  Created by Kalló Barbara on 2019. 10. 18..
//  Copyright © 2019. Kalló Barbara. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(hexString: String, alpha:CGFloat = 1.0) {
        var hexint: UInt32 = 0
        let scanner: Scanner = Scanner(string: hexString)
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        scanner.scanHexInt32(&hexint)
        let red = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue = CGFloat((hexint & 0xff) >> 0) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
