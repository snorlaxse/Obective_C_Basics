//
//  Person.m
//  01-引用计数器的基本操作
//
//  Created by Captain on 10/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import "Person.h"


@implementation Person


// 当一个Person对象被回收的时候，就会自动调用这个方法
- (void)dealloc
{
    NSLog(@"Person对象被回收");
    
    // super 的dealloc一定要调用，而且放在最后面
    [super dealloc];
}
@end
