//
//  Sharing.swift
//  ModelSynchro
//
//  Created by Jonathan Samudio on 01/04/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

/*
    Auto-Generated using ModelSynchro
*/

struct Sharing: Codable {
	let type: Int
	let uri: String

	enum CodingKeys: String, CodingKey {
		case type = "type"
		case uri = "uri"
	}
}