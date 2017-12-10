//
//  main.m
//  01-引用计数器的基本操作
//
//  Created by Captain on 10/12/2017

/* 不勾选ARC
 1. 方法的基本使用
 1> retain : 计数器加一，会返回对象本身
 2> release : 计数器减一，没有返回值
 3> retainCount : 获取当前计数器
 4> dealloc ：
    * 当一个对象要被回收的时候，就会被调用
    * 一定要调用[super dealloc]，这句调用一定要放在最后面
 
 2. 概念：
 1> 僵尸对象：所占用内存已经被回收的对象，僵尸对象不能再被使用
 2> 野指针：指向僵尸对象（不可用内存）的指针，给野指针发送消息会报错（EXC_BAD_ACCESS）
 3> 空指针：没有指向任何地址的指针(存储的东西是nil\NULL\0),给空指针发送消息不会报错
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    
    // 1
    Person *p = [[Person alloc] init];
    
    //NSUInteger c = [p retainCount];

    //NSLog(@"计数器：%ld",c);

    // 2 retain方法返回的是对象本身
    [p retain];
    
    // 1
    [p release];
    
    // 0  野指针：指向僵尸对象(不可用内存)的指针
    [p release];
    
    // 1 (×) 对象死不能复生
     [p retain];
    
    // EXC_BAD_INSTRUCTION:
    // -[Person setAge:]: message sent to deallocated instance 0x10044a4d0
    // 给已经释放的对象发送了一条-setAge:消息
    p.age = 10;
    
    
    // 指针p变成空指针
    p = nil;
    
    //  EXC_BAD_ACCESS ： 访问了一块坏的内存（已经被回收、已经不可用的内存）
    // 野指针错误
    // OC不存在空指针错误，给空指针发送消息，不报错
    [p release];
    [p release];
    [p release];
    
    return 0;
}
