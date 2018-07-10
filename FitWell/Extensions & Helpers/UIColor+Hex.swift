//
//  UIColor+Hex.swift
//  Air100
//
//  Created by Lefteris Haritou on 07/02/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(_ red: Int, _ green : Int, _ blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    ///Convenience initializer with hex values
    convenience init(hex:Int) {
        self.init((hex >> 16) & 0xff, (hex >> 8) & 0xff, hex & 0xff)
    }
}
