//
//  UserData.swift
//  FitWell
//
//  Created by Lefteris Haritou on 09/07/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import Foundation

struct UserData : Codable {
	let profile : Profile?
	let raceData : RaceData?
	let routes : [Route]?

	enum CodingKeys: String, CodingKey {
		case profile
		case raceData = "races"
		case routes = "route"
	}
}
