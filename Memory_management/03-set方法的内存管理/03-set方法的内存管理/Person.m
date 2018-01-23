//
//  Person.m
//  03-set方法的内存管理
//
//  Created by Captain on 21/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)setCar:(Car *)car
{
    if(car != _car)
    {
    // 对当前正在使用的车(旧车)做一次release
    [_car release]; // 空值对release不操作
     
    // 对新车做一次retain操作
    _car = [car retain];
    }
}

- (Car *)car
{
    return _car;
}

- (void)setAge:(int)age
{
    _age = age;
}

- (int)age
{
    return _age;
}


- (void)dealloc
{
    // 当人不在了，代表不用车了
    // 对车做一次release操作
    [_car release];
    NSLog(@"%d岁的Person对象被回收了",_age);
    
    [super dealloc];
}
@end
