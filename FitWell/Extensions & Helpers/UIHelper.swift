//
//  UIHelper.swift
//  
//
//  Created by Lefteris Haritou on 13/03/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit

class UIHelper: NSObject {
    class func topViewController() -> UIViewController? {
        var topController = UIApplication.shared.keyWindow?.rootViewController
        while topController?.presentedViewController != nil {
            topController = topController?.presentedViewController
        }
        return topController
    }
}
