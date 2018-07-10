//
//  Route.swift
//  FitWell
//
//  Created by Lefteris Haritou on 09/07/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import Foundation

struct Route : Codable {
	let transportation : String?
	let iconType : String?
	let time : String?
	let description : String?

	enum CodingKeys: String, CodingKey {

		case transportation
		case iconType = "icon_type"
		case time
		case description
	}
}
