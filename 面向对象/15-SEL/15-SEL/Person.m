//
//  Person.m
//  15-SEL
//
//  Created by Captain on 10/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import "Person.h"

@implementation Person
+(void)test
{
    NSLog(@"test-------");
}

- (void)test2
{
    
    // _cmd 代表着当前方法  _cmd == @selector(test2);
    
    NSString*str = NSStringFromSelector(_cmd);
    
    //会引发死循环
//    [self performSelector:_cmd];
    
    NSLog(@"call -(void)test2-------%@",str);
}

- (void)test3:(NSString *)abc
{
    NSLog(@"test3-----%@",abc);
}
@end
