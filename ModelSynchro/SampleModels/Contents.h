//
//  Contents.h
//  ModelSynchro
//
//  Created by Jonathan Samudio on 01/04/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

/*
    Auto-Generated using ModelSynchro
*/

#import <Foundation/Foundation.h>
#import "KeyValueGroups.h"

@interface Contents: NSObject

@property (nonatomic, assign) NSInteger appliesToProductId;

@property (nonatomic, strong) NSString *contentHtml;

@property (nonatomic, strong, nullable) NSArray<KeyValueGroups *> *keyValueGroups;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end