//
//  Person.m
//  02-多个对象之间的内存管理
//
//  Created by Captain on 13/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setBook:(Book *)book
{
    _book = [book retain]; // 计数器 retain +1 操作
    
}

- (Book *)book
{
    return _book;
}


- (void)dealloc
{
    [_book release];
    
    NSLog(@"Person对象被回收");
    
    [super dealloc];
}
@end
