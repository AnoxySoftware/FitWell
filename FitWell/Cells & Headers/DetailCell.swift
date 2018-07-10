//
//  DetailCell.swift
//  FitWell
//
//  Created by Lefteris Haritou on 09/07/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit

class DetailCell : UITableViewCell {

    @IBOutlet weak var lblTransportation: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    
    func configure(withVM model: DetailsPresentable) {
        self.lblTransportation.text = model.transportationType
        self.lblTime.text = model.time
        self.lblText.text = model.description
        //TODO: Add Images for transportation Type (missing assets)
        self.imgView.image = UIImage(named:"bus")
    }
}
