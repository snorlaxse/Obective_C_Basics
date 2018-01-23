//
//  Car.m
//  03-set方法的内存管理
//
//  Created by Captain on 21/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)setSpeed:(int)speed{
    _speed = speed;
    
}
- (int)speed{
    return _speed;
}

- (void)dealloc
{
    /*
     _speed : 直接访问成员变量
     self->_speed : 直接访问成员变量
     self.speed : get方法
     [self speed] : get方法
     */
    NSLog(@"速度为%d的Car对象被回收了",self->_speed);
    
    [super dealloc];
}
@end
