//
//  main.m
//  08-构造方法
//
//  Created by Captain on 2017/11/28.
//  Copyright © 2017年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

//构造方法：用来初始化对象的方法，是个对象方法，-开头
//重写构造方法的目的：为了让对象创建出来，其成员变量就会有一些固定值
/*
 重写构造方法的注意点：
 1.先调用父类的构造方法 ([super init])
 2.再进行子类内部成员变量的初始化
 
 */

int main(int argc, const char * argv[])
{
  
    //Person *p = [Person new];
    /*
     完整地创建一个可用的对象
     1.分配存储空间 +alloc
     2.初始化 -init
     */
    
    //1.调用+alloc分配存储空间
    //Person *p1 = [Person alloc];
    //2.调用-init进行初始化
    //Person *p2 = [p1 init];
    
    
    //每个Person对象创建出来，其_age都是10
    //Person *p3 = [[Person alloc] init];
    
    Student *stu = [Student new];
    Student *stu1 = [[Student alloc] init];
    
    NSLog(@"-----");
    
    return 0;
}
