//
//  Person.m
//  第2个OC项目
//
//  Created by Captain on 2017/11/25.
//  Copyright © 2017年 captain. All rights reserved.
//

#import "Person.h"

@implementation Person

#pragma mark - 年龄的setter和getter
- (void)setAge:(int)age
{
    _age = age;
}

- (int)age
{
    return _age;
}


#pragma mark - 姓名的setter和getter
#pragma mark 姓名的set方法
- (void)setName:(NSString *)name
{
    _name = name;
    
    
}
#pragma mark 姓名的get方法
- (NSString *)name
{
    return _name;
}


#pragma mark - 其他方法

@end


