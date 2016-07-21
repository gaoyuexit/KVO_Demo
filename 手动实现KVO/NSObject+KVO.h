//
//  NSObject+KVO.h
//  手动实现KVO
//
//  Created by 郜宇 on 16/6/25.
//  Copyright © 2016年 郜宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (KVO)

- (void)gy_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end
