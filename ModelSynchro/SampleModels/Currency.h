//
//  Currency.h
//  ModelSynchro
//
//  Created by Jonathan Samudio on 01/04/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

/*
    Auto-Generated using ModelSynchro
*/

#import <Foundation/Foundation.h>

@interface Currency: NSObject

@property (nonatomic, strong) NSString *isoCode;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *symbol;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end