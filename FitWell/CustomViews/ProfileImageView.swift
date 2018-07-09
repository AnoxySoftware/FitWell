//
//  RoundedImageView.swift
//  FitWell
//
//  Created by Lefteris Haritou on 09/07/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit

@IBDesignable
class ProfileImageView :  UIImageView {
    @IBInspectable var borderWidth: CGFloat = 4 {
        didSet {
            self.setNeedsLayout()
            
        }
    }
    
    @IBInspectable var borderColor: UIColor = .white {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.layoutSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth = self.borderWidth
        self.layer.borderColor = self.borderColor.cgColor
    }
}
