//
//  EmitterViewModel.m
//  HybridNativeReactMVVM
//
//  Created by Jonathan Samudio on 1/10/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"

/**
 View model to handle events received from React-Native.
 */
@interface RCT_EXTERN_MODULE(EmitterViewModel, RCTEventEmitter<RCTBridgeModule>)
RCT_EXTERN_METHOD(receivedEvent:(NSString *) event data:(id)data)
@end
