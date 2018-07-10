//
//  DetailHeaderView.swift
//  FitWell
//
//  Created by Lefteris Haritou on 09/07/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import UIKit
import MapKit
import AlamofireImage

class DetailHeaderView: UITableViewHeaderFooterView {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var profileImgView: ProfileImageView!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var verifiedImgView: UIImageView!
    @IBOutlet weak var totalTime: UILabel!
    @IBOutlet weak var totalKM: UILabel!
    @IBOutlet weak var totalCal: UILabel!
    
    func configure(withVM model: DetailsHeaderPresentable) {
        if let profileURL = URL(string:model.profileImageURLString) {
            self.profileImgView.af_setImage(withURL: profileURL)
        }
        self.userLabel.text = model.profileName
        self.locationLabel.text = model.address
        self.verifiedImgView.isHidden = !model.verified
        self.totalCal.text = model.totalCalories
        self.totalKM.text = model.totalDistance
        self.totalTime.text = model.totalTime
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: model.latitude, longitude:model.longitude)
        self.mapView.addAnnotation(annotation)
        self.mapView.showAnnotations(self.mapView.annotations, animated: true)
        self.mapView.selectAnnotation(annotation, animated: true)
    }
}
