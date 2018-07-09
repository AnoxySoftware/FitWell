//
//  RacesModel.swift
//  FitWell
//
//  Created by Lefteris Haritou on 09/07/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import Foundation

struct RacesModel: Codable {
    let locationName: String?
    let profileImageUrl: URL?
    let raceDuration: TimeInterval?
    let raceLength: Double?
    let userCount: Int?
    let hasDetails: Bool?
    
    private enum CodingKeys: String, CodingKey {
        case locationName
        case profileImageUrl = "profile_image_url"
        case raceDuration = "duration"
        case userCount
        case hasDetails
    }
}
