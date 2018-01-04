//
//  Flag.h
//  ModelSynchro
//
//  Created by Jonathan Samudio on 01/04/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

/*
    Auto-Generated using ModelSynchro
*/

#import <Foundation/Foundation.h>

@interface Flag: NSObject

@property (nonatomic, strong, readonly) BOOL *isSoldOut;

@property (nonatomic, strong, readonly) BOOL *isTodaysSpecial;

@property (nonatomic, strong, readonly) NSString *className;

@property (nonatomic, strong, readonly) NSString *name;

- (id)initWithDictionary:(NSDictionary *)dictionary

@end