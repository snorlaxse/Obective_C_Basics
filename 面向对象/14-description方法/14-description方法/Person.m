//
//  Person.m
//  14-description方法
//
//  Created by Captain on 09/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import "Person.h"

@implementation Person

//决定了实例对象的输出结果
//- (NSString *)description
//{
//    // 下面代码会引发死循环
////    NSLog(@"%@",self);
//    
//    return [NSString stringWithFormat:@"name=%@,age=%d",_name,_age];
//
//    //    return @"234567";
//}

// 决定了类对象的输出结果
+ (NSString *)description
{
    return @"abc";
}

@end
