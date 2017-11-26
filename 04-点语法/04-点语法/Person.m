//
//  Person.m
//  04-点语法
//
//  Created by Captain on 2017/11/26.
//  Copyright © 2017年 captain. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setAge:(int)age
{
    
    NSLog(@"setAge:");
    
    _age = age;
    
    //会引发死循环
    //self.age = age; // [self aetAge:age];
    
    
}

- (int)age
{
    NSLog(@"age");
    
//    return _age;
    return self->_age;
    
    //会引发死循环
    //return self.age; // [self age];
}

- (void)setName:(NSString *)name
{
    _name = name;
}
- (NSString *)name
{
//    return _name;
    return @"Rose";
}

@end
