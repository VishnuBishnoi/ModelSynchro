//
//  Contents.swift
//  ModelSynchro
//
//  Created by Jonathan Samudio on 01/16/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

/*
    Auto-Generated using ModelSynchro
*/

struct Contents: Codable {
	let appliesToProductId: Int
	let contentHtml: String

	enum CodingKeys: String, CodingKey {
		case appliesToProductId = "appliesToProductId"
		case contentHtml = "contentHtml"
	}
}