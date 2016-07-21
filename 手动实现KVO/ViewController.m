//
//  ViewController.m
//  手动实现KVO
//
//  Created by 郜宇 on 16/6/25.
//  Copyright © 2016年 郜宇. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+KVO.h"
@interface ViewController ()
{
    __strong Person *_p;
}
@end


/**
 *  1. 动态创建NSKVONotifying_Person类,NSKVONotifying_Person是Person的子类
 *  2. 修改当前对象的isa指针->NSKVONotifying_Person
 *  3. 只要调用对象的set方法,就会调用NSKVONotifying_Person的set方法
 *  4. 重写NSKVONotifying_Person的set方法 : 1.[super set:] 2.通知观察者,告诉属性改变
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Person *p = [[Person alloc] init];
    _p = p;
    
    // 系统的这个方法是NSObject分类中的方法
//    [p addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
    // 创建自己的NSObject分类
    [p gy_addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"%d", _p.age);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _p.age++;
}

- (void)dealloc
{
    [_p removeObserver:self forKeyPath:@"age"];
}




@end
