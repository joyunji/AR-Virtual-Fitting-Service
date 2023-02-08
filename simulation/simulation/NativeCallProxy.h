//
//  NativeCallProxy.h
//  simulation
//
//  Created by 이다민 on 2022/11/04.
//

#ifndef NativeCallProxy_h
#define NativeCallProxy_h


#endif /* NativeCallProxy_h */

#import <Foundation/Foundation.h>

@protocol NativeCallsProtocol
@required

// other methods
@end

__attribute__ ((visibility("default")))
@interface FrameworkLibAPI : NSObject
+(void) registerAPIforNativeCalls:(id<NativeCallsProtocol>) aApi;

@end
