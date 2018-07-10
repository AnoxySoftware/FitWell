//
//  RaceData.swift
//  FitWell
//
//  Created by Lefteris Haritou on 09/07/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import Foundation

struct RaceData : Codable {
	let totalTime : TimeInterval?
	let totalLength : Int?
	let totalCal : Int?

	enum CodingKeys: String, CodingKey {
		case totalTime = "total_time"
		case totalLength = "total_length"
		case totalCal = "total_cal"
	}

}
