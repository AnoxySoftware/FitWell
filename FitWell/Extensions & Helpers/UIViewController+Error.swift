//
//  UIViewController+Error.swift
//  
//
//  Created by Lefteris Haritou on 09/04/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlertWithTitle(_ title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: UIAlertActionStyle.default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
