//
//  Person.m
//  06-@property和@synthesize
//
//  Created by Captain on 2017/11/27.
//  Copyright © 2017年 captain. All rights reserved.
//

#import "Person.h"

@implementation Person

//@synthesize自动生成age的setter和getter实现，并会访问_age这个成员变量
@synthesize age = _age;

//- (void)setAge:(int)age
//{
//    _age = age;
//}
//- (int)age
//{
//    return _age;
//}

@synthesize height = _height;
@synthesize weight = _weight, name = _name;

- (void)test
{
//    NSLog(@"age = %d,_age = %d",age,_age);
}
@end
