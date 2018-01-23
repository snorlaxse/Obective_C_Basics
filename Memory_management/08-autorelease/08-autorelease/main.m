//
//  main.m
//  08-autorelease
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

/*
 1. autorelease的基本用法
 1> 会将对象放到一个自动释放池中
 2> 当自动释放池被销毁时，会对池子里面的所有对象做一次release操作
 3> 会返回对象本身
 4> 调用完autorelease 方法后，对象的计数器不变
 
 2. autorelease的好处
 1> 不用再关心对象释放的时间
 2> 不用再关心什么时候调用release
 
 3. autorelease的使用注意
 1> 占用内存较大的对象不要随便使用autorelease
 2> 占用内存较小的对象使用autorelease，没有太大影响
 
 4. 错误写法
 1> alloc之后调用了autorelease，又调用了release
 @autoreleasepool
 {
    // p - 1
    Person *p =[[[Person alloc]init] autorelease];
 
    // p - 0
    [p release];
 }
 
 2> 连续调用多次autorelease
 @autoreleasepool
 {
    Person *p =[[[[Person alloc]init] autorelease] autorelease];
 }
 
 5. 自动释放池
 1> 在iOS程序运次过程中，会创建无数个池子。这些池子都是以栈结构存在(先进后出)
 2> 当一个对象调用autorelease方法时，会将这个对象放到栈顶的释放池
 
 6. 自动释放池的创建方式
 1> iOS 5.0前
 NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];
 
 [pool release]; // [pool drain];
 
 2> iOS 5.0 开始
 @autoreleasepool
 {

 }
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];
    
    Person *pp =[[[Person alloc]init] autorelease];
    
    [pool release]; // [pool drain];
    
    
    @autoreleasepool
    {
        // p - 1
        Person *p =[[[[Person alloc]init] autorelease] autorelease];
        
        // p - 0
       // [p release];
    }
    
    return 0;
}


void test()
{
    @autoreleasepool
    {// { 开始代表创建了一个释放池
        
        // autorelease 方法会返回对象本身
        // 调用完autorelease 方法后，对象的计数器不变
        // autorelease 会将对象放到一个自动释放池
        // 当自动释放池被销毁时，会对池子里面的所有对象做一次release操作
        Person *p = [[[Person alloc]init]autorelease];
        
        p.age = 10;
        
        @autoreleasepool // 适用于占用内存比较小的对象，非精确控制(延迟release)
        {
            Person *p2 = [[[Person alloc]init]autorelease];
            
            p2.age = 10;
            
        }
        
    }// } 结束代表销毁释放池
    
}
