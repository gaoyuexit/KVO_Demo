//
//  GYKVONotifying_Person.m
//  手动实现KVO
//
//  Created by 郜宇 on 16/6/25.
//  Copyright © 2016年 郜宇. All rights reserved.
//

#import "GYKVONotifying_Person.h"
#import <objc/runtime.h>
@implementation GYKVONotifying_Person


- (void)setAge:(int)age
{
    [super setAge:age];
    
    NSObject *observer = objc_getAssociatedObject(self, @"observer");
    [observer observeValueForKeyPath:@"age" ofObject:nil change:nil context:nil];
    
    /**
     *  手动模式的KVO
     
     实现手动通知的对象必须实现 automaticallyNotifiesObserversForKey 方法。为了实现手动观察消息，你必须在改变值之前调用 willChangeValueForKey: ，改变值之后调用 didChangeValueForKey:
     */
    
}

@end
