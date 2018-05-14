//
//  UserInfo.swift
//  ModelSynchro
//
//  Created by Jonathan Samudio on 05/14/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

/*
    Auto-Generated using ModelSynchro
*/

struct UserInfo: Codable {
	let bookmarked: Bool
	let eventId: String
	let going: Bool
	let guests: [Guests]?
	let guestsCount: Int?
	let waitlisted: Bool

	enum CodingKeys: String, CodingKey {
		case bookmarked = "bookmarked"
		case eventId = "eventId"
		case going = "going"
		case guests = "guests"
		case guestsCount = "guestsCount"
		case waitlisted = "waitlisted"
	}
}
