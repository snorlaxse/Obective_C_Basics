//
//  Student.m
//  05-成员变量的作用域
//
//  Created by Captain on 2017/11/26.
//  Copyright © 2017年 captain. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)study
{
    // _height is private
    //_height = 10;
    
    [self setHeight:10];
    
    [self height];
    
    _weight = 100;
}
@end
