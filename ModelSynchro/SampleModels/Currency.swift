//
//  Currency.swift
//  ModelSynchro
//
//  Created by Jonathan Samudio on 12/01/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

/*
    Auto-Generated using ModelSynchro
*/

struct Currency: Codable {
	let isoCode: String
	let name: String
	let symbol: String

	enum CodingKeys: String, CodingKey {
		case name = "name"
		case isoCode = "isoCode"
		case symbol = "symbol"
	}
}