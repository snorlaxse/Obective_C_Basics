//
//  Student.m
//  13-类的本质
//
//  Created by Captain on 07/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import "Student.h"

@implementation Student

// 在类被加载的时候调用
+(void)load
{
    NSLog(@"Student ---- load");
}

+ (void)initialize
{
    // 监听类的初始化过程
    NSLog(@"Student----initialize");
}
@end
