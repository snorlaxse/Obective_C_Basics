//
//  main.m
//  04-点语法
//
//  Created by Captain on 2017/11/26.
//  Copyright © 2017年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    Person *p = [Person new];
    
    //点语法的本质还是方法调用
    //当使用点语法时，编译器会自动展开成相应的方法
    p.age = 10;  // [p setAge:10];
    
    int a = p.age;  // [p age]
    
    p.name = @"Captain";
    
    NSString *s = [p name];
    
    NSLog(@"name is %@",s);
    
    return 0;
}
