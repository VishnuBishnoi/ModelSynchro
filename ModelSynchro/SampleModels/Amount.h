//
//  Amount.h
//  ModelSynchro
//
//  Created by Jonathan Samudio on 01/03/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

/*
Auto-Generated using ModelSynchro
*/

@interface Amount

@property (nonatomic, strong, readonly) Currency *currency;

@property (nonatomic, strong, readonly) double *value;

	enum CodingKeys: String, CodingKey {
		case currency = "currency"
		case value = "value"
	}
@end