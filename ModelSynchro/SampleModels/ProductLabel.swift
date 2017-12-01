//
//  ProductLabel.swift
//  ModelSynchro
//
//  Created by Jonathan Samudio on 12/01/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

/*
    Auto-Generated using ModelSynchro
*/

struct ProductLabel: Codable {
	let type: Int
	let uri: String

	enum CodingKeys: String, CodingKey {
		case type = "type"
		case uri = "uri"
	}
}