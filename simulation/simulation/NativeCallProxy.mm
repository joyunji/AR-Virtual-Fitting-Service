//
//  NativeCallProxy.m
//  simulation
//
//  Created by 이다민 on 2022/11/04.
//

#import <Foundation/Foundation.h>

@protocol NativeCallsProtocol
@required
// other methods
@end

__attribute__ ((visibility("default")))
@interface FrameworkLibAPI : NSObject
+(void) registerAPIforNativeCalls:(id<NativeCallsProtocol>) aApi;

@end
