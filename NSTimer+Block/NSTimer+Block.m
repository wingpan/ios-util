//
//  NSTimer+Block.m
//  yixin_iphone
//
//  Created by PanFengfeng  on 14-3-12.
//  Copyright (c) 2014年 Netease. All rights reserved.
//

#import "NSTimer+Block.h"

@interface PFTimerTarget : NSObject

@property (nonatomic, copy)FireBlock fireBlock;

- (void)timerFire;
@end

@implementation PFTimerTarget

- (void)timerFire {
    if (self.fireBlock) {
        self.fireBlock();
    }
}

@end

@implementation NSTimer (Block)


+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti fireBlock:(FireBlock)b repeats:(BOOL)yesOrNo {
    PFTimerTarget *target = [[PFTimerTarget alloc] init];
    target.fireBlock = b;
    
    return [NSTimer timerWithTimeInterval:ti
                                   target:target
                                 selector:@selector(timerFire)
                                 userInfo:nil
                                  repeats:yesOrNo];
    
}

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti fireBlock:(FireBlock)b repeats:(BOOL)yesOrNo {
    PFTimerTarget *target = [[PFTimerTarget alloc] init];
    target.fireBlock = b;
    
    return [NSTimer scheduledTimerWithTimeInterval:ti
                                            target:target
                                          selector:@selector(timerFire)
                                          userInfo:nil
                                           repeats:yesOrNo];
}

@end

@implementation CADisplayLink (Block)

+ (CADisplayLink *)displayLinkWithBlock:(FireBlock)b {
    PFTimerTarget *target = [[PFTimerTarget alloc] init];
    target.fireBlock = b;
    
    return [CADisplayLink displayLinkWithTarget:target selector:@selector(timerFire)];
}

@end
