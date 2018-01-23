//
//  main.m
//  07-循环引用
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//


/*
 1.@class的作用: 仅仅告诉编译器，某个名称是一个类
 @class Person; // 仅仅告诉编译器，Person是一个类
 
 2.开发中引用一个类的规范
 1> 在.h文件中用@class来声明类
 2> 在.m文件中用#import来包含类的所有东西
 
 注：@class和#import的区别
 
 3. 两端循环引用解决方案
 1> 一端用retain
 2> 一端用assign
 
 */
#import <Foundation/Foundation.h>
#import "Card.h"
#import "Person.h"

int main(int argc, const char * argv[])
{

    Person *p = [[Person alloc] init];
    
    Card *c = [[Card alloc]init];
    
    p.card = c;
    c.person = p;
    
    [c release];
    [p release];
    
    return 0;
}
