//
//  Student.m
//  08-构造方法
//
//  Created by Captain on 2017/11/28.
//  Copyright © 2017年 captain. All rights reserved.
//

#import "Student.h"

@implementation Student

//学生对象初始化完毕后，年龄就是10，学号就是1

- (id)init
{
    if (self = [super init])
    {
        _no = 1;
    }
    
    return self;
}

@end
