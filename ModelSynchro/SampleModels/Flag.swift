//
//  Flag.swift
//  ModelSynchro
//
//  Created by Jonathan Samudio on 12/01/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

/*
    Auto-Generated using ModelSynchro
*/

struct Flag: Codable {
	let className: String
	let isSoldOut: Bool
	let isTodaysSpecial: Bool
	let name: String

	enum CodingKeys: String, CodingKey {
		case className = "className"
		case isSoldOut = "isSoldOut"
		case isTodaysSpecial = "isTodaysSpecial"
		case name = "name"
	}
}