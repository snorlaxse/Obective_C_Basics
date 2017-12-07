//
//  main.m
//  13-类的本质
//
//  Created by Captain on 07/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"
#import "GoodStudent.h"

/*
 1. 当程序启动时，就会加载项目中所有的类和分类，而且加载后会调用每个类和分类的+load方法。只会调用一次
 
 2. 当第一次使用某个类时，就会调用当前类的+initialize方法
 
 3. 先加载父类，再加载子类(先调用父类的+load方法，再调用子类的+load方法)
    先初始化父类，再初始化子类(先调用父类的+initialize方法，再调用子类的+initialize方法)
 
 */

int main(int argc, const char * argv[])
{
    //[[Person alloc] init];

    [[Student alloc] init];
    
    //[[GoodStudent alloc] init];
    
    return 0;
}

void test1()
{
    Person *p = [[Person alloc] init];
    
    //        [Person test];
    
    
    // 内存中的类对象
    // 类对象 == 类
    Class c = [p class];
    [c test];
    
    Person *p2 = [[c alloc] init];
    
    NSLog(@"------");
}
void test()
{
    //利用Person这个类创建了2个Person类型的对象
    Person *p = [[Person alloc] init];
    
    Person *p2 = [[Person alloc] init];
    
    Person *p3 = [[Person alloc] init];
    
    // 获取内存中的类对象
    Class c = [p class];
    
    Class c2 = [p2 class];
    
    // 获取内存中的类对象
    Class c3 = [Person class];
    
    NSLog(@"c = %p, c2 = %p, c3 = %p",c,c2,c3);
    
    //  类本身也是一个对象，是Class类型的对象，简称类对象
    
    /*
     利用Class 创建 Person类对象
     
     利用 Person类对象 创建 Person类型的对象
     */
}
