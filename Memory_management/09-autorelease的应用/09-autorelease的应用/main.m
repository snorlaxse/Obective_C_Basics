//
//  main.m
//  09-autorelease的应用
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "GoodPerson.h"

/*
 1. 系统自带的方法里面没有包含alloc、new和copy，说明返回的对象都是autorelease的
 
 2. 开发中经常会提供一些类方法，快速创建一个已经autorelease过的对象
 1> 创建对象时不要直接用类名，一般使用self
 + (id)person
 {
    return [[[self alloc] init] autorelease];
 }
 */

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Person *p  = [Person personWithAge:10];
        
        
        GoodPerson *p2 = [GoodPerson personWithAge:20];
        
        p2.money = 100;
    }
    
    
    return 0;
}

void test()
{
    Person *p = [[Person alloc]init];
    
    p.age = 10;
    
    [p release];
    
    // 包
    // Student com.mj.test
    // Student com.mj.test2
    
    // MJStudent
    // SBStudent
    
    // NS -- Next Step
    
    @autoreleasepool
    {
        
        
        //        Person *p = [[[Person alloc]init]autorelease];
        //
        //        p.age = 30;
        
        //        Person *p2 = [Person person];
        //        p2.age = 20;
        //
        
        Person *p2 = [Person personWithAge:100];
        
        NSString *str = @"123456789";
        
        NSString *str2 = [NSString stringWithFormat:@"age is %d",10];
        
        NSNumber *num = [[NSNumber alloc] initWithInt:10];
        [num release];
        
        NSNumber *num2 = [NSNumber numberWithInt:100];
    }
    
}
