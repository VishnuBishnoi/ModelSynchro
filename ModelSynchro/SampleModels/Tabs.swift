//
//  Tabs.swift
//  ModelSynchro
//
//  Created by Jonathan Samudio on 12/01/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

/*
    Auto-Generated using ModelSynchro
*/

struct Tabs: Codable {
	let contents: [Contents]
	let name: String

	enum CodingKeys: String, CodingKey {
		case name = "name"
		case contents = "contents"
	}
}