//
//  main.m
//  01-ARC的基本使用
//
//  Created by Captain on 23/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//


/*
 ARC的判断准则：只要没有强制指针指向对象，就会释放对象
 
 1. ARC的特点
 1> 不允许调用release、retain、retaincount
 2> 允许重写dealloc，但是不允许调用[super dealloc]
 3> @property的参数
 * strong : 成员变量是强指针，相当于原来的retain(适用于OC对象类型)
 * weak   : 成员变量是弱指针，相当于原来的assign的赋值含义(适用于OC对象类型)
 * assign : 适用于非OC对象类型
 4> 以前的retain改为用strong，其他一切不变 
 
 指针分两种:
 1> 强指针: 默认情况下,所有的指针都是强指针 __strong
 2> 弱指针: __weak
 */

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[])
{
    Dog *d  = [[Dog alloc] init];
    Dog *d2  = [[Dog alloc] init];
    
    Person *p = [[Person alloc] init];
    p.dog = d;
    
    d = nil;
    // p = nil;
    NSLog(@"%@",p.dog);
    
//    p.dog = d2;  //  Dog is dealloc
//    NSLog(@"%@",d2);
    
    return 0;
}


void test()
{
    Person *p = [[Person alloc] init] ;
    
    __weak Person *p2 = p ;
    
    
    p = nil;
    
    p2 = nil;
    
    // 错误写法(没有意义的写法)
    __weak Person *p3 = [[Person alloc] init];
    
    NSLog(@"%@",p3);
    
    NSLog(@"----------");
    
    
}
