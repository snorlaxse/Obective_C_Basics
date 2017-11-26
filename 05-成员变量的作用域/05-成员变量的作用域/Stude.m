//
//  Stude.m
//  05-成员变量的作用域
//
//  Created by Captain on 2017/11/26.
//  Copyright © 2017年 captain. All rights reserved.
//

#import "Stude.h"

@implementation Stude

- (void)study
{
    //_height = 10;   // _height is private
    
    [self setHeight:10];
    
    [self height];
    
    _weight = 100;
}
@end
