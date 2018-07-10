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
    
    func configure(withModel model: RacesModel) {
        self.locationLabel.text = model.locationName ?? ""
        self.durationLabel.text = model.raceDuration?.timeIntervalAsString(allowedUnits: [.day,.hour]) ?? ""
        self.detailArrow.isHidden = !(model.hasDetails ?? false)
        self.raceLenghtLabel.text = String(format:NSLocalizedString("%@ KM", comment: "Track length in Kilometers"),model.raceLength?.description ?? "")
        self.userRacesLabel.text = model.userCount?.description ?? ""
        if let profileImageUrl = model.profileImageUrl {
            self.profileImageView.af_setImage(withURL: profileImageUrl)
        }
        if let bgImageURL = model.bgImageURL {
            self.bgImageView.af_setImage(withURL: bgImageURL)
        }
    }
}
