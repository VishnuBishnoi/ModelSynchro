//
//  Rating.swift
//  ModelSynchro
//
//  Created by Jonathan Samudio on 01/16/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

/*
    Auto-Generated using ModelSynchro
*/

struct Rating: Codable {
	let average: Double
	let count: Int

	enum CodingKeys: String, CodingKey {
		case average = "average"
		case count = "count"
	}
}