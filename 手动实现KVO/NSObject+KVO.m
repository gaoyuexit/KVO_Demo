//
//  NSObject+KVO.m
//  手动实现KVO
//
//  Created by 郜宇 on 16/6/25.
//  Copyright © 2016年 郜宇. All rights reserved.
//

#import "NSObject+KVO.h"
#import "GYKVONotifying_Person.h"
#import <objc/runtime.h>

@implementation NSObject (KVO)
/**
 *  1. 动态创建NSKVONotifying_Person类,NSKVONotifying_Person是Person的子类
 *  2. 修改当前对象的isa指针->NSKVONotifying_Person
 *  3. 只要调用对象的set方法,就会调用NSKVONotifying_Person的set方法
 *  4. 重写NSKVONotifying_Person的set方法 : 1.[super set:] 2.通知观察者,告诉属性改变
 */
- (void)gy_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context
{
    // 修改当前对象的isa指针: 本质就是改变当前对象的类名
    object_setClass(self, [GYKVONotifying_Person class]);
    
    // 把观察者保存到当前对象GYKVONotifying_Person中,让GYKVONotifying_Person可以调用观察着的observeValueForKeyPath...方法
    objc_setAssociatedObject(self, @"observer", observer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    // 在GYKVONotifying_Person可以得到observer
}

@end
