//
//  Person.m
//  13-类的本质
//
//  Created by Captain on 07/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (void)test
{
    NSLog(@"调用了test方法----");
}

// 当程序启动的时候，就会加载一次项目中所有的类。类加载完毕后就会调用+load方法
// 在类被加载的时候调用
+(void)load
{
    NSLog(@"Person ---- load");
}

// 当第一次使用这个类的时候，就会调用一次initialize方法
+ (void)initialize
{
    NSLog(@"Person----initialize");
}

@end
