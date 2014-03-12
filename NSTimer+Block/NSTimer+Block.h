//
//  NSTimer+Block.h
//  yixin_iphone
//
//  Created by PanFengfeng  on 14-3-12.
//

/**
 * NSTimer和CADisplayLink在设置target时，会将target retain，如果target（一般是controller）同时持有NSTimer或
 * CADisplayLink，将会形成retain cycle，所以引入block解除这种cycle，并方便编程，但是请务必清楚了解block中的内存
 * 管理
 */

#import <Foundation/Foundation.h>

typedef void (^FireBlock) ();

@interface NSTimer (Block)

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti fireBlock:(FireBlock)b repeats:(BOOL)yesOrNo;
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti fireBlock:(FireBlock)b repeats:(BOOL)yesOrNo;

@end

@interface CADisplayLink (Block)

+ (CADisplayLink *)displayLinkWithBlock:(FireBlock)b;

@end
