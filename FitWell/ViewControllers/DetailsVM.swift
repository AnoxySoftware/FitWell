//
//  DetailsVM.swift
//  FitWell
//
//  Created by Lefteris Haritou on 10/07/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import Foundation

protocol DetailsPresentable {
    var transportationType: String { get }
    var image: String { get }
    var time : String { get }
    var description: String { get }
}

protocol DetailsHeaderPresentable {
    var profileImageURLString: String { get }
    var profileName: String { get }
    var address: String { get }
    var verified: Bool { get }
    var totalTime: String { get }
    var totalDistance: String { get }
    var totalCalories: String { get }
    var latitude: Double { get }
    var longitude: Double { get }
}

class DetailsVM : NSObject {
    
    struct DetailsViewModel: DetailsPresentable {
        let transportationType: String
        var image: String
        var time: String
        var description: String
        
        init(withRoute route: Route) {
            self.transportationType = route.transportation ?? ""
            self.image = route.iconType ?? ""
            self.time = route.time ?? ""
            self.description = route.description ?? ""
        }
    }
    
    struct DetailsHeaderViewModel: DetailsHeaderPresentable {
        let profileImageURLString: String
        var profileName: String
        var address: String
        var verified: Bool
        var totalTime: String
        var totalDistance: String
        var totalCalories: String
        var latitude: Double
        var longitude: Double
        
        init(withProfile profile: Profile, raceData: RaceData) {
            self.profileImageURLString = profile.profileImageURL ?? ""
            self.profileName = "\(profile.firstName ?? "") \(profile.lastName ?? "")"
            self.address = "\(profile.city ?? ""), \(profile.country ?? "")"
            self.verified = profile.verified ?? false
            self.totalTime = raceData.totalTime?.timeIntervalAsString(allowedUnits: [.day,.hour]) ?? ""
            self.totalCalories = raceData.totalCal?.description ?? ""
            self.totalDistance = raceData.totalLength?.description ?? ""
            self.latitude = Double(profile.lat ?? "0") ?? 0
            self.longitude = Double(profile.lon ?? "0") ?? 0
        }
    }
    
    private var userData : UserData?
    
    init(userData:UserData? = nil) {
        super.init()
        if let userData = userData {
            self.userData = userData
        }
    }
    
    func setUserData(userData:UserData) {
        self.userData = userData
    }
    
    func hasData() -> Bool {
        if let routes = self.getRoutes() {
            return routes.count > 0
        }
        return false
    }
    
    //returns the number of items in the section
    func numberOfItemsInSection(section:Int) -> Int {
        return self.userData?.routes?.count ?? 0
    }
    
    func dataForIndexPath(indexPath:IndexPath) -> DetailsPresentable? {
        if let routes = self.getRoutes() {
            return DetailsViewModel(withRoute: routes[indexPath.row])
        }
        return nil
    }
    
    func dataForHeaderInSection(section:Int) -> DetailsHeaderPresentable? {
        if let userData = self.userData, let profile = userData.profile, let raceData = userData.raceData {
            return DetailsHeaderViewModel(withProfile: profile, raceData: raceData)
        }
        return nil
    }
    
    private func getRoutes() -> [Route]? {
        if let userData = self.userData, let routes = userData.routes {
            return routes
        }
        return nil
    }
}

