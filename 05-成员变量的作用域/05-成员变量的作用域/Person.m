//
//  Person.m
//  05-成员变量的作用域
//
//  Created by Captain on 2017/11/26.
//  Copyright © 2017年 captain. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)test
{
    _age = 19;
    
    _height = 20;
    
    _weight = 50;
}

- (void)setHeight:(int)height
{
    _height = height;
    
}
- (int)height
{
    return _height;
}
@end
