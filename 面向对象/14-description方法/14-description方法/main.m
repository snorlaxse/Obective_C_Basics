//
//  main.m
//  14-description方法
//
//  Created by Captain on 09/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

void test10()
{
    // 输出当前函数名
    NSLog(@"%s",__func__);
}

int main(int argc, const char * argv[])
{
    // 输出行号
    NSLog(@"%d",__LINE__);
    
    // NSLog输出C语言字符串的时候，不能有中文
    //NSLog(@"%s",__FILE__);
    
    // 输出源文件的名称
    printf("%s\n",__FILE__);
    
    test10();
    
    Person *p = [[Person alloc] init];
    NSLog(@"%p",&p);  // 指针变量的地址
    NSLog(@"%p",p);   //  对象的地址
    NSLog(@"%@",p);    // <类名：对象地址>
    
    return 0;
}

void test2()
{
    
    Class c = [Person class];
    
    // 1. 会调用类的+description方法
    // 2. 拿到+description方法的返回值（NSString *）显示到屏幕上
    NSLog(@"%@",c);

}

void test1()
{
    Person *p = [[Person alloc] init];
    p.age = 10;
    p.name = @"Captain";
    // 默认情况下，利用NSLog和%@输出对象时，结果是：<类名：内存地址>
    
    //1.调用对象的-description方法
    //2.拿到-description方法的返回值(NSString *)显示到屏幕上
    //3.-description方法默认返回的是“类名+内存地址”
    NSLog(@"%@",p);
    
    Person *p2 = [[Person alloc] init];
    p2.age =25;
    p2.name = @"Jack";
    NSLog(@"%@",p2);
    
    //    NSString *name = @"Michael";
    //    NSLog(@"我的名字是%@",name); // 打印对象使用%@
    
}
