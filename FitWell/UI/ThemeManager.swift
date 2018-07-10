//
//  ThemeManager.swift
//  Air100
//
//  Created by Lefteris Haritou on 07/02/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit

extension UIColor {
    @nonobjc static let mainGrayColor = UIColor(hex: 0x4a4a4a)
    @nonobjc static let mainBlueColor = UIColor(hex: 0x2da6de)
}

extension UIFont {
    @nonobjc static let regularFont = UIFont(name: "HelveticaNeue-Light", size: 15.0)
    @nonobjc static let boldFont = UIFont(name: "HelveticaNeue-Medium", size: 15.0)
    
    class func regularFont(size:CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: size)!
    }
    
    class func boldFont(size:CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Medium", size: size)!
    }
}

extension UIButton {
    @objc dynamic var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
}

class ThemeManager {
    
    class func applyDefaultTheme() {
        
        UINavigationBar.appearance().barTintColor = UIColor.mainBlueColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.font: UIFont.regularFont!, NSAttributedStringKey.foregroundColor:UIColor.white]
        UINavigationBar.appearance().tintColor = UIColor.white
        
    }
    
}
