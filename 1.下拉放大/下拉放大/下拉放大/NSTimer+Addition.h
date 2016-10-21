//
//  NSTimer+Addition.h
//  下拉放大
//
//  Created by lijunfeng on 16/10/21.
//  Copyright © 2016年 李俊峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (Addition)
- (void)pauseTimer;
- (void)resumeTimer;
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;
@end
