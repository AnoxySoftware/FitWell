//
//  Profile.swift
//  FitWell
//
//  Created by Lefteris Haritou on 09/07/2018.
//  Copyright © 2018 Lefteris Haritou. All rights reserved.
//

import Foundation

struct Profile : Codable {
	let email : String?
	let gender : String?
	let profileImageURL : String?
	let firstName : String?
	let lastName : String?
	let street : String?
	let city : String?
	let country : String?
	let lat : String?
	let lon : String?
	let verified : Bool?

	enum CodingKeys: String, CodingKey {
		case email
		case gender
		case profileImageURL = "profile_url"
		case firstName = "first_name"
		case lastName = "last_name"
		case street
		case city
		case country
		case lat
		case lon
		case verified
	}
}
