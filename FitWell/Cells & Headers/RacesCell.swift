//
//  RacesCell.swift
//  FitWell
//
//  Created by Lefteris Haritou on 09/07/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit
import AlamofireImage

class RacesCell : UITableViewCell {
    
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var detailArrow: UIImageView!
    @IBOutlet weak var raceLenghtLabel: UILabel!
    @IBOutlet weak var userRacesLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    func configure(withVM model: RacesPresentable) {
        self.locationLabel.text = model.location
        self.durationLabel.text = model.duration
        self.detailArrow.isHidden = model.detailsHidden
        self.raceLenghtLabel.text = model.length
        self.userRacesLabel.text = model.userRaces
        if let profileURL = URL(string:model.profileURLString) {
            self.profileImageView.af_setImage(withURL: profileURL)
        }
        if let bgImageURL =  URL(string:model.bgURLString) {
            self.bgImageView.af_setImage(withURL: bgImageURL)
        }
    }
}
