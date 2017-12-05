//
//  main.m
//  11-分类-Category
//
//  Created by Captain on 05/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//
/*
 分类的作用：在不改变原来类内容的基础上，可以为类增加一些方法
 
 使用注意：
 1.分类只能增加方法，不能增加成员变量
 2.分类方法实现中可以访问原来类中声明的成员变量/方法
 3.分类可以重新实现类中的方法，但是会覆盖掉原来的方法，会导致原来的方法无法使用(重写)
 4.方法调用的优先级：分类(最后参与编译的分类优先) --> 原来的类 --> 父类
 
 */

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Person+Captain.h"
#import "Person+Michael.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *p = [[Person alloc] init];
        p.age = 10;
        
        //优先去分类中查找，再去原来的类中找，最后在父类中找
        [p test];
        
        [p study];
        
        [p sleep];
    }
    return 0;
}
