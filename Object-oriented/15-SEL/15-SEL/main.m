//
//  main.m
//  15-SEL
//
//  Created by Captain on 10/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

/*
 SEL其实是对方法的一种包装，将方法包装成一个SEL类型的数据，去找对应的方法地址，就可以调用方法
 
 其实消息就是SEL 
 */

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[])
{
    Person *p = [[Person alloc] init];
    
    
    // 间接调用test2方法
    NSString *name = @"test2";
    SEL s2 = NSSelectorFromString(name);
    [p performSelector:s2];
    
    [p performSelector:@selector(test2)];
    
    [p test2];
    
    // 间接调用test3方法
    
    // SEL对象的创建
    SEL s = @selector(test3:);
    [p performSelector:s withObject:@"123"];
    
    [p performSelector:@selector(test3:) withObject:@"456"];
    
    [p test3:@"789"];
    
    // 1.把test2包装成SEL类型的数据
    // 2.根据SEL数据找到对应的方法地址
    // 3.根据方法地址调用对应多的方法
    
    return 0;
}
