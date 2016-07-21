//
//  Person.h
//  手动实现KVO
//
//  Created by 郜宇 on 16/6/25.
//  Copyright © 2016年 郜宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
//{
//    @public
//    int _age;
//    // 如果外界 person->_age ++; 这样给_age赋值的话,不会调用set方法,也不会触发KVO
//}

@property (nonatomic, assign) int age;

@end
