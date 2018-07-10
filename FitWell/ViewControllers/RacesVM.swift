//
//  RacesVM.swift
//  FitWell
//
//  Created by Lefteris Haritou on 10/07/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import Foundation

protocol RacesPresentable {
    var location: String { get }
    var duration: String { get }
    var length: String { get }
    var userRaces: String { get }
    var profileURLString: String { get }
    var bgURLString: String { get }
    var detailsHidden: Bool { get }
}

class RacesVM : NSObject {
    
    struct RaceViewModel: RacesPresentable {
        
        let location: String
        var duration: String
        var length: String
        var userRaces: String
        var profileURLString: String
        var bgURLString: String
        var detailsHidden: Bool
        
        init(withRace model: RacesModel) {
            self.location = model.locationName ?? ""
            self.duration = model.raceDuration?.timeIntervalAsString(allowedUnits: [.day,.hour]) ?? ""
            self.length = String(format:NSLocalizedString("%@ KM", comment: "Track length in Kilometers"),model.raceLength?.description ?? "")
            self.userRaces = model.userCount?.description ?? ""
            self.profileURLString = model.profileImageUrl?.absoluteString ?? ""
            self.bgURLString = model.bgImageURL?.absoluteString ?? ""
            self.detailsHidden = !(model.hasDetails ?? false)
        }
    }
    
    private var races = [RacesModel]()
    
    init(racesArray:[RacesModel]? = nil) {
        super.init()
        if let racesArray = racesArray {
            self.races = racesArray
        }
    }
    
    func hasData() -> Bool {
        return self.races.count > 0
    }
    
    func setRaces(racesArray:[RacesModel]) {
        self.races = racesArray
    }
    
    //returns the number of items in the section
    func numberOfItemsInSection(section:Int) -> Int {
        return races.count
    }
    
    func dataForIndexPath(indexPath:IndexPath) -> RacesPresentable {
        return RaceViewModel(withRace: races[indexPath.row])
    }
}
